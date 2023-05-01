import 'package:flutter/material.dart';

import 'LoginPage.dart';

class SCADAIntroduction extends StatefulWidget {
  static const String routeName = "SCADAIntroduction";

  @override
  _SCADAIntroductionState createState() => _SCADAIntroductionState();
}

class _SCADAIntroductionState extends State<SCADAIntroduction> {
  final List<Map<String, String>> _introductionData = [
    {
      "title": "What is SCADA?",
      "description":
          "SCADA stands for Supervisory Control and Data Acquisition. It is a system used to monitor and control industrial processes and infrastructure.",
      "imagePath": "assets/images/scada1.png",
    },
    {
      "title": "How does SCADA work?",
      "description":
          "SCADA systems use sensors and other devices to collect data from industrial processes and infrastructure. This data is then transmitted to a central control system where it is analyzed and used to make decisions about how to control the processes.",
      "imagePath": "assets/images/scada2.png",
    },
    {
      "title": "Why is SCADA important?",
      "description":
          "SCADA systems are important because they allow operators to monitor and control industrial processes and infrastructure from a central location. This can improve efficiency, reduce downtime, and increase safety.",
      "imagePath": "assets/images/scada3.png",
    },
  ];

  int _currentIndex = 0;

  void _goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: _introductionData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _introductionData[index]["imagePath"]!,
                      height: 300,
                      width: 300,
                    ),
                    SizedBox(height: 32.0),
                    Text(
                      _introductionData[index]["title"]!,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        _introductionData[index]["description"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Visibility(
            visible: _currentIndex == _introductionData.length - 1,
            child: FloatingActionButton(
              onPressed: () => _goToLogin(context),
              child: Icon(Icons.login),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _introductionData.length; i++) {
      indicators.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == i ? Colors.white : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}
