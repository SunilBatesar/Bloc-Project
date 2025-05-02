import 'package:bloc_project/Bloc/Notes/note_bloc.dart';
import 'package:bloc_project/Bloc/Notes/note_state.dart';
import 'package:bloc_project/Components/BottomSheets/add_note_bottom_sheet.dart';
import 'package:bloc_project/Components/Cards/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF8EF),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Your Thoughts, Organized',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFB433),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          return GridView.builder(
            itemCount: state.notes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              // childAspectRatio: 3 / 2,
            ),
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, index) {
              return CustomCardWidget(
                title: '${state.notes[index].title}',
                subtitle: '${state.notes[index].description}',
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Color(0xFFFBF8EF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => AddNoteBottomSheet(),
          );
        },
        backgroundColor: Color(0xFFFFB433),
        child: Icon(Icons.add, color: Color(0xFFFBF8EF), size: 24),
      ),
    );
  }
}
