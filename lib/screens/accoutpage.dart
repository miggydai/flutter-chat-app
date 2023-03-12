import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/globals.dart';
import 'package:flutter_chat_app/widgets/profilecard.dart';
import 'package:flutter_chat_app/widgets/usercard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/office.dart';

class ChooseAccPage extends StatefulWidget {
  const ChooseAccPage({super.key});

  @override
  State<ChooseAccPage> createState() => _ChooseAccPageState();
}

class _ChooseAccPageState extends State<ChooseAccPage> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> _officeStream =
      FirebaseFirestore.instance.collection('office').snapshots();
  List<Office> _offices = [];
  final name = Globals.fullName;
  final pic = Globals.profPic;

  @override
  void initState() {
    List<Office> allOffices = [];
    // TODO: implement initState
    db.collection("office").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          Office office = Office(
            office_id: docSnapshot.data()['office_id'],
            office_name: docSnapshot.data()['office_name'],
            bg_image: docSnapshot.data()['bg_image'],
          );
          allOffices.add(office);
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }

        setState(() {
          _offices = allOffices;
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Globals.profPic != ""
          ? Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // transform: GradientRotation(-140),
                      colors: [
                        Color.fromRGBO(31, 47, 152, 1),
                        Color.fromRGBO(46, 170, 250, 1)
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Log in as:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileCard(image: pic, name: name, isActive: true),
                        Center(
                            child: StreamBuilder<QuerySnapshot>(
                          stream: _officeStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SpinKitDancingSquare(
                                color: Colors.white,
                                size: 10.0,
                              );
                            }

                            return Wrap(
                              runSpacing: 8.0,
                              spacing: 15.0,
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                Office office = Office(
                                    office_id: data['office_id'],
                                    office_name: data['office_name'],
                                    bg_image: data['bg_image']);
                                return ProfileCard(
                                    image: data['bg_image'],
                                    name: data['office_name'],
                                    isActive: true);
                              }).toList(),
                            );
                          },
                        )),
                      ],
                    ),
                  ],
                )
              ],
            )
          : SpinKitCircle(color: Colors.white, size: 10.0),
    );
  }
}
