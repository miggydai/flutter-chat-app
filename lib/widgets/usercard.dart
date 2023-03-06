import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'button.dart';

class UserCard extends StatelessWidget {
  final String pic;
  final String text;
  const UserCard({Key? key, required this.pic, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(pic),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            Container(
                width: MediaQuery.of(context).size.width * .4,
                height: 50,
                child:
                    button(icon: FontAwesomeIcons.doorOpen, text: text, n: 2))
            // ElevatedButton.icon(onPressed: () {}, icon: Icon(FontAwesomeIcons.cartShopping, size: 15,), label: Text("add to cart", style: TextStyle(fontWeight: FontWeight.w500 ),), style: ElevatedButton.styleFrom(primary: Color.fromRGBO(107, 137, 232, 1)),)
          ],
        ));
  }
}
