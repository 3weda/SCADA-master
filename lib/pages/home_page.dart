import 'package:flutter/material.dart';
import 'package:weather/pages/report_screen.dart';
import 'package:weather/pages/settings_screen.dart';
import 'package:weather/pages/support_screen.dart';
import 'barChart_screen.dart';
import 'humidity_screen.dart';
import 'infrared_screen.dart';
import 'mail_screen.dart';
import 'notification_screen.dart';
import 'pressure_screen.dart';
import 'sensor_screen.dart';
import 'tempreture_screen.dart';
import 'table_screen.dart';
import 'About_screen.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'data page';

  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 2;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 2,
            backgroundColor: Colors.cyanAccent,
            onTap: (index) {
              print(index);
            },
            items: [
              BottomNavigationBarItem(
                  label: "acount",
                  icon: Icon(
                    Icons.account_box,
                    color: Colors.deepPurpleAccent,
                  )),
              BottomNavigationBarItem(
                  label: "QR",
                  icon: Icon(
                    Icons.qr_code_scanner_sharp,
                    color: Colors.deepPurpleAccent,
                  )),
              BottomNavigationBarItem(
                  label: "table",
                  icon: Icon(
                    Icons.table_chart_outlined,
                    color: Colors.deepPurpleAccent,
                  )),
            ]),
        backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("SCADA"),
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * .5,
          backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
          child: ListView(
            children: [
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Icon(Icons.home),
                title: Text("home"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Icon(Icons.sensors),
                title: Text("sensor"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sensor(),
                      ));
                },
              ),
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Icon(Icons.notifications_none),
                title: Text("notifications"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Notifications(),
                      ));
                },
              ),
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Icon(Icons.mail),
                title: Text("mail"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mail(),
                      ));
                },
              ),
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Icon(Icons.table_chart_outlined),
                title: Text("tables"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tables(),
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
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Tempreture(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent.shade100,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue, width: 2)),
                    width: width * .40,
                    height: height * .25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.device_thermostat,
                            color: Colors.red.shade600, size: 40),
                        Text("Tempreture",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Humidity()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent.shade100,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue, width: 2)),
                    width: width * .40,
                    height: height * .25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.water_drop, color: Colors.blue, size: 40),
                        Text("Humidity",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      ],
                    ),
                  ),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pressure(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amberAccent.shade200,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue, width: 2)),
                    width: width * .40,
                    height: height * .25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.tire_repair_outlined,
                            color: Colors.grey.shade600, size: 40),
                        Text("Pressure",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Infrared(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue, width: 2)),
                    width: width * .40,
                    height: height * .25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.sensors, color: Colors.black54, size: 40),
                        Text("Infrared",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      ],
                    ),
                  ),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Tables(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue, width: 2)),
                    width: width * .40,
                    height: height * .25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.table_chart_outlined,
                            color: Colors.black, size: 40),
                        Text("Tables",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BarChart(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue, width: 2)),
                    width: width * .40,
                    height: height * .25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.bar_chart, color: Colors.yellow, size: 40),
                        Text("Bar Chart",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
