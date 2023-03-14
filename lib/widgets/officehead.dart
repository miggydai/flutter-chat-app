import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/office.dart';

class OfficeHead extends StatefulWidget {
  const OfficeHead({super.key});

  @override
  State<OfficeHead> createState() => _OfficeHeadState();
}

class _OfficeHeadState extends State<OfficeHead> {
 final FirebaseFirestore db = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> _officeStream =
      FirebaseFirestore.instance.collection('office').snapshots();
  List<Office> _offices = [];
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
    return StreamBuilder<QuerySnapshot>(
      stream: _officeStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView(
            shrinkWrap: true,
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  Office office = Office(
                      office_id: data['office_id'],
                      office_name: data['office_name'],
                      bg_image: data['bg_image']);
                  return ListTile(
                    title: Text(data['office_name']),
                  );
                })
                .toList()
                .cast(),
          ),
        );
      },
    );
  }
}