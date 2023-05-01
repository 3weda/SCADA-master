import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Profil extends StatefulWidget {
  static const String routeName = "profil";

  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String _name = "John Doe";
  String _email = "johndoe@example.com";
  String _phone = "+1 123-456-7890";
  String _photoUrl = "assets/images/profile_picture.png";
  String _job = "Supervisor in the SCADA project";
  String _qualification = "Bachelor's degree in Electrical Engineering";
  TextEditingController nameController = TextEditingController();
  final picker = ImagePicker();
  late File _image;
  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
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

  void _editPhoto() async {
    String? newPhotoUrl = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Photo"),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Enter new photo URL",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, _photoUrl),
            child: Text("Save"),
          ),
        ],
      ),
    );
    if (newPhotoUrl != null) {
      setState(() {
        _photoUrl = newPhotoUrl;
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
        title: Text("Profil"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16.0),
          CircleAvatar(
            radius: 64.0,
            backgroundImage: AssetImage(_image.path),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, color: Colors.white),
              SizedBox(width: 8.0),
              GestureDetector(
                onTap: () => launch("mailto:$_email"),
                child: Text(
                  _email,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Colors.white),
              SizedBox(width: 8.0),
              GestureDetector(
                onTap: () => launch("tel:$_phone"),
                child: Text(
                  _phone,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.work, color: Colors.white),
              SizedBox(width: 8.0),
              Text(
                _job,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, color: Colors.white),
              SizedBox(width: 8.0),
              Text(
                _qualification,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
