import 'package:flutter/material.dart';

class NoteAddForm extends StatefulWidget {
  final Function(String, String, String) addNote;
  const NoteAddForm({super.key, required this.addNote});

  @override
  NoteAddFormState createState() => NoteAddFormState();
}

class NoteAddFormState extends State<NoteAddForm> {
  String title = '';
  String note = '';
  String imageUrl = '';

  _showAddNoteDialog() {
    setState(() {
      title = '';
      note = '';
      imageUrl = '';
    });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Your Story'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => setState(() => title = value),
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                onChanged: (value) => setState(() => note = value),
                decoration: InputDecoration(labelText: 'Your Story'),
              ),
              TextField(
                onChanged: (value) => setState(() => imageUrl = value),
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.addNote(title, note, imageUrl);
                        Navigator.pop(context);
                      },
                      child: Text('Add Story'),
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.yellow[200],
      onPressed: _showAddNoteDialog,
      child: Icon(Icons.add),
    );
  }
}
