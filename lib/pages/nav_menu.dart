import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather/pages/About_screen.dart';
import 'package:weather/pages/mail_screen.dart';
import 'package:weather/pages/note_screen.dart';
import 'package:weather/pages/notification_screen.dart';
import 'package:weather/pages/qrcode.dart';
import 'package:weather/pages/report_screen.dart';
import 'package:weather/pages/settings_screen.dart';
import 'package:weather/pages/support_screen.dart';
import 'package:weather/pages/table_screen.dart';

import 'LoginPage.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({super.key});

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  late User? user;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .5,
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${user?.email}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: Icon(Icons.announcement_rounded),
            title: Text("report"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Report(),
                  ));
            },
          ),
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: Icon(Icons.note_add),
            title: Text("Note"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Note(),
                  ));
            },
          ),
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: Icon(Icons.settings),
            title: Text("settings"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Setting(),
                  ));
            },
          ),
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: Icon(Icons.adobe_sharp),
            title: Text("about"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(),
                  ));
            },
          ),
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: Icon(Icons.contact_support_outlined),
            title: Text("support"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Support(),
                  ));
            },
          ),
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: Icon(Icons.exit_to_app),
            title: Text("sign out"),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginPage.routeName, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
