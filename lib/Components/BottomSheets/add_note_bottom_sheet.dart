import 'package:bloc_project/Bloc/Notes/note_bloc.dart';
import 'package:bloc_project/Bloc/Notes/note_event.dart';
import 'package:bloc_project/Components/TextFields/custom_text_form_field.dart';
import 'package:bloc_project/Models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Add New Note',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFB433),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Title',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            controller: titleController,
            hintText: 'Enter title here',
          ),
          SizedBox(height: 20),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            controller: descriptionController,
            maxLines: 5,
            hintText: 'Enter description here',
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Save the note
              final NoteModel newNote = NoteModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                title: titleController.text,
                description: descriptionController.text.trim(),
              );
              // Dispatch the event to add the note
              context.read<NoteBloc>().add(AddNote(note: newNote));
              // Clear the text fields
              titleController.clear();
              descriptionController.clear();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFB433),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Save Note',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
