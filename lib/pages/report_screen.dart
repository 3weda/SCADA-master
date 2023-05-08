import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:weather/pages/nav_menu.dart';

class Report extends StatefulWidget {
  static const String routeName = "report";

  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final _formKey = GlobalKey<FormState>();
  final _temperatureController = TextEditingController();
  final _humidityController = TextEditingController();
  final _gasController = TextEditingController();
  final List<List<String>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final dataList = prefs.getStringList('dataList');
    if (dataList != null) {
      setState(() {
        _dataList.addAll(dataList.map((data) => data.split(',')));
      });
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final dataList = _dataList.map((data) => data.join(',')).toList();
    await prefs.setStringList('dataList', dataList);
  }

  Future<void> _addValuesToList() async {
    final temperature = _temperatureController.text;
    final humidity = _humidityController.text;
    final gas = _gasController.text;
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final formattedTime = DateFormat('HH:mm:ss').format(now);

    setState(() {
      _dataList.add([temperature, humidity, gas, formattedDate, formattedTime]);
    });

    _temperatureController.clear();
    _humidityController.clear();
    _gasController.clear();

    await _saveData();
  }

  Future<String> _exportDataToCsv() async {
    final csvData = const ListToCsvConverter().convert([
      ['Temperature', 'Humidity', 'Gas', 'Date', 'Time'],
      ..._dataList,
    ]);
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.csv';
    final file = File(filePath);
    await file.writeAsString(csvData);
    return filePath;
  }

  Future<void> _shareCsvFile() async {
    final filePath = await _exportDataToCsv();
    await Share.shareFiles([filePath], text: 'CSV file');
  }

  Future<void> _clearData() async {
    setState(() {
      _dataList.clear();
    });
    await _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Report"),
      ),
      drawer: NavMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _temperatureController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Temperature',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a value';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _humidityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Humidity',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a value';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _gasController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Gas',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a value';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addValuesToList();
                    }
                  },
                  child: Text('AddValues to List'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _exportDataToCsv();
                  },
                  child: Text('Exported List Data to CSV file'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _shareCsvFile();
                  },
                  child: Text('Share CSV file'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _clearData();
                  },
                  child: Text('Clear Data'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Reading',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Temperature',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Humidity',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Gas',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Time',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _dataList.length,
                  itemBuilder: (context, index) {
                    final data = _dataList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${data[0]}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${data[1]}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${data[2]}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${data[3]}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${data[4]}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
