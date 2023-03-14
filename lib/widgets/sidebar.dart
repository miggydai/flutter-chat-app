import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth_services.dart';
import 'package:sidebarx/sidebarx.dart';

import '../globals.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key? key,
    required this.index,
  });

  final index;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      showToggleButton: false,
      controller: SidebarXController(selectedIndex: index, extended: false),
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(31, 47, 152, 1),
                Color.fromRGBO(46, 170, 250, 1)
              ],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        hoverColor: actionColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        // itemTextPadding: const EdgeInsets.only(left: 30),
        // selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: actionColor),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white60,
        ),
      ),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(Globals.profPic),
              radius: 20,
            ),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.message,
          label: 'messages',
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context, '/Home', ModalRoute.withName('/'));
              Globals.x = 0;
              print(Globals.x);
          }
        ),
        SidebarXItem(
          icon: Icons.people,
          label: 'Office',
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context, '/Offices', ModalRoute.withName('/'));
            Globals.x = 1;
            print(Globals.x);
          },
        ),
        SidebarXItem(
          icon: Icons.person,
          label: 'Profile',
          onTap: () {},
        ),
      ],
      footerItems: [
        SidebarXItem(
          icon: Icons.door_back_door_sharp,
          label: 'Logout',
          onTap: () async {
            await AuthService().signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, '/', ModalRoute.withName('/'));
          },
        ),
      ],
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Messages';
    case 1:
      return 'Contacts';
    case 2:
      return 'Profile';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color.fromRGBO(31, 47, 152, 1);
const canvasColor = Color.fromRGBO(46, 170, 250, 1);
const scaffoldBackgroundColor = Colors.white;
const accentCanvasColor = Colors.white;
const white = Colors.white;
final actionColor = Color.fromARGB(255, 169, 216, 247);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
