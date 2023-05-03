import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Note extends StatefulWidget {
  static const String routeName = "Note";

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<Note> {
  List<String> notes = [];

  TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<File> _getNotesFile() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String notesFilePath = "${appDocumentsDirectory.path}/notes.json";
    return File(notesFilePath);
  }

  Future<void> _loadNotes() async {
    try {
      File notesFile = await _getNotesFile();
      String notesJson = await notesFile.readAsString();
      List<dynamic> notesList = jsonDecode(notesJson);
      setState(() {
        notes = notesList.cast<String>();
      });
    } catch (e) {
      print("Error loading notes: $e");
    }
  }

  Future<void> _saveNotes() async {
    try {
      File notesFile = await _getNotesFile();
      String notesJson = jsonEncode(notes);
      await notesFile.writeAsString(notesJson);
    } catch (e) {
      print("Error saving notes: $e");
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
        title: Text("Notes"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    notes[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _noteController.text = notes[index];
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Edit Note"),
                              content: TextField(
                                controller: _noteController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: "Enter your note",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text("Save"),
                                  onPressed: () {
                                    setState(() {
                                      notes[index] = _noteController.text;
                                    });
                                    _saveNotes();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          notes.removeAt(index);
                        });
                        _saveNotes();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _noteController.clear();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("New Note"),
                content: TextField(
                  controller: _noteController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Enter your note",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text("Save"),
                    onPressed: () {
                      setState(() {
                        notes.add(_noteController.text);
                      });
                      _saveNotes();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
