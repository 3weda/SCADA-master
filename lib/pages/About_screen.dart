import 'package:flutter/material.dart';

class About extends StatelessWidget {
  static const String routeName = "/about";

  const About({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("About"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              "SCADA Project",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Supervisory Control and Data Acquisition (SCADA) is a system that is used to monitor and control industrial processes. The SCADA system gathers real-time data from sensors and devices in the field, processes and analyzes the data, and then provides control signals to the equipment in the field. SCADA systems are used in a variety of industries such as oil and gas, water and wastewater, manufacturing, and transportation.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Licenses",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "This application is licensed under the MIT License. The SCADA system used in this application is licensed under the GNU General Public License (GPL) version 3.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
