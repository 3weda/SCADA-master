import 'package:flutter/material.dart';

class hum_details extends StatelessWidget {
  final int index;

  hum_details(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('humidity detail sensor$index'),
      ),
      body: Center(
        child: Text('the sensor $index'),
      ),
    );
  }
}
