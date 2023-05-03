import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Profil extends StatefulWidget {
  static const String routeName = "profil";

  const Profil({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profil> {
  String _name = "John Doe";
  String _email = "johndoe@example.com";
  String _phone = "+1 123-456-7890";
  String _job = "Supervisor in the SCADA project";
  String _qualification = "Bachelor's degree in Electrical Engineering";
  TextEditingController nameController = TextEditingController();
  final picker = ImagePicker();
  late File _image;

  @override
  void initState() {
    super.initState();
    _image = File('assets/images/profile_picture.png');
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _editName() async {
    String? newName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Name"),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Enter new name",
          ),
          controller: nameController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _name = nameController.text;
              });
              Navigator.pop(context, _name);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
    if (newName != null) {
      setState(() {
        _name = newName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16.0),
          CircleAvatar(
            radius: 64.0,
            backgroundImage: AssetImage('assets/images/profile_picture.png'),
          ),
          SizedBox(height: 16.0),
          GestureDetector(
            onTap: _editName,
            child: Text(
              _name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Table(
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(4),
            },
            children: [
              TableRow(
                children: [
                  Icon(Icons.email, color: Colors.white),
                  GestureDetector(
                    onTap: () => launch("mailto:$_email"),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        _email,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Icon(Icons.phone, color: Colors.white),
                  GestureDetector(
                    onTap: () => launch("tel:$_phone"),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        _phone,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Icon(Icons.work, color: Colors.white),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      _job,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Icon(Icons.school, color: Colors.white),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      _qualification,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
