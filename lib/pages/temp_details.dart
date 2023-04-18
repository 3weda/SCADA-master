import 'package:flutter/material.dart';

class temp_details extends StatelessWidget {
  final int index;

  temp_details(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempreture detail sensor$index'),
      ),
      body: Center(),
    );
  }
}
