import 'package:flutter/material.dart';

class Tables extends StatelessWidget {
  static const String routeName = "table";

  const Tables({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> data = [
      ["1", '30', "65", "47"],
      ["2", '66', "25", "65"],
      ["3", '58', "65", "98"],
      ["4", '14', "78", "45"],
      ["5", '98', "41", "35"],
      ["6", '65', "25", "78"],
      ["7", '78', "65", "25"],
      ["8", '65', "98", "78"],
      ["10", '36', "25", "69"],
      ["11", '45', "65", "47"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
      ["ss", 'sf', "sdf", "sfv"],
    ];
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Tables"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
              columns: [
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
              ],
              rows: List.generate(
                data.length,
                (index) => DataRow(cells: [
                  DataCell(Text(
                    data[index][0],
                    style: TextStyle(color: Colors.white),
                  )),
                  DataCell(Text(
                    data[index][1],
                    style: TextStyle(color: Colors.white),
                  )),
                  DataCell(Text(
                    data[index][2],
                    style: TextStyle(color: Colors.white),
                  )),
                  DataCell(Text(
                    data[index][3],
                    style: TextStyle(color: Colors.white),
                  )),
                ]),
              )),
        ),
      ),
    );
  }
}
