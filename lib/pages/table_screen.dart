import 'package:flutter/material.dart';

class Tables extends StatelessWidget {
  static const String routeName = "table";

  const Tables({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> data = [
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
