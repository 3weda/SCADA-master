import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  static const String routeName = "report";

  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("report"),
      ),
    );
  }
}
