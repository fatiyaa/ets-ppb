import 'package:flutter/material.dart';

import '../model/note.dart';

class NoteEditForm extends StatefulWidget {
  final Note oldNote;
  final Function(String, String, String) editNote;
  const NoteEditForm({
    super.key,
    required this.editNote,
    required this.oldNote,
  });

  @override
  NoteEditFormState createState() => NoteEditFormState();
}

class NoteEditFormState extends State<NoteEditForm> {
  late TextEditingController titleController;
  late TextEditingController noteController;
  late TextEditingController imageUrlController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.oldNote.title);
    noteController = TextEditingController(text: widget.oldNote.note);
    imageUrlController = TextEditingController(text: widget.oldNote.imageUrl);
  }

  _showEditNoteDialog() {
    setState(() {
      titleController.text = widget.oldNote.title;
      noteController.text = widget.oldNote.note;
      imageUrlController.text = widget.oldNote.imageUrl;
    });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Your Story'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: noteController,
                decoration: InputDecoration(labelText: 'Your Story'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.editNote(
                          titleController.text,
                          noteController.text,
                          imageUrlController.text,
                        );
                        Navigator.pop(context);
                      },
                      child: Text('Edit Note'),
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
    return IconButton(onPressed: _showEditNoteDialog, icon: Icon(Icons.edit));
  }
}
