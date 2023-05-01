import 'package:flutter/material.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/pages/qrcode.dart';
import 'package:weather/pages/table_screen.dart';
import 'package:weather/pages/profil.dart';

class NavHome extends StatefulWidget {
  const NavHome({Key? key}) : super(key: key);
  static const String routeName = "NavHome";

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  int currentTab = 0;
  final List<Widget> screens = [
    QRcode(),
    Tables(),
    Profil(),
    HomePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
        onPressed: () {},
        child: Icon(
          Icons.camera_alt,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = QRcode();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner_sharp,
                          color: currentTab == 1
                              ? Color.fromRGBO(36, 50, 94, 1.0)
                              : Colors.grey,
                        ),
                        Text(
                          'QRcode',
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color.fromRGBO(36, 50, 94, 1.0)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? Color.fromRGBO(36, 50, 94, 1.0)
                              : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0
                                ? Color.fromRGBO(36, 50, 94, 1.0)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Tables();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.table_chart_outlined,
                          color: currentTab == 2
                              ? Color.fromRGBO(36, 50, 94, 1.0)
                              : Colors.grey,
                        ),
                        Text(
                          'Tables',
                          style: TextStyle(
                            color: currentTab == 2
                                ? Color.fromRGBO(36, 50, 94, 1.0)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profil();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle_sharp,
                          color: currentTab == 3
                              ? Color.fromRGBO(36, 50, 94, 1.0)
                              : Colors.grey,
                        ),
                        Text(
                          'Profil',
                          style: TextStyle(
                            color: currentTab == 3
                                ? Color.fromRGBO(36, 50, 94, 1.0)
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
