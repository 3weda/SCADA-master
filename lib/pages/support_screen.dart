import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  static const String routeName = "contact";

  const Support({Key? key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 50, 94, 1.0),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Contact"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Enter your message",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // Send message logic here
                    },
                    icon: Icon(Icons.send),
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => launch("tel:123-456-7890"),
                icon: Icon(Icons.phone),
                label: Text("Mobile Call (Enter to send)"),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => launch("https://www.facebook.com/"),
                icon: Icon(Icons.facebook),
                label: Text("Facebook (Enter to send)"),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => launch("https://mail.google.com/"),
                icon: Icon(Icons.email),
                label: Text("Gmail (Enter to send)"),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => launch("https://www.linkedin.com/"),
                icon: Icon(Icons.account_tree_outlined),
                label: Text("LinkedIn (Enter to send)"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
