import 'package:flutter/material.dart';

class Tables extends StatelessWidget {
  static const String routeName = "table";

  const Tables({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Tables"),
      ),
      body: Center(
        child: DataTable(columns: [
          DataColumn(
            label: Text(
              'ID',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.blue,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'temperature',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.red,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Humidity',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.red,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'pressure',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.red,
              ),
            ),
          ),
        ], rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('50')),
            DataCell(Text('60')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('40')),
            DataCell(Text('30')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('80')),
            DataCell(Text('70')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('36')),
            DataCell(Text('60')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('55')),
            DataCell(Text('66')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('6')),
            DataCell(Text('77')),
            DataCell(Text('58')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('7')),
            DataCell(Text('29')),
            DataCell(Text('79')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('8')),
            DataCell(Text('36')),
            DataCell(Text('66')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('9')),
            DataCell(Text('44')),
            DataCell(Text('88')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('10')),
            DataCell(Text('36')),
            DataCell(Text('55')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('11')),
            DataCell(Text('88')),
            DataCell(Text('55')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('12')),
            DataCell(Text('66')),
            DataCell(Text('45')),
            DataCell(Text('?')),
          ]),
          DataRow(cells: [
            DataCell(Text('13')),
            DataCell(Text('47')),
            DataCell(Text('66')),
            DataCell(Text('?')),
          ]),
        ]),
      ),
    );
  }
}
