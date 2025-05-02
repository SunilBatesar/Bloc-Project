import 'package:bloc/bloc.dart';
import 'package:bloc_project/Bloc/Notes/note_event.dart';
import 'package:bloc_project/Bloc/Notes/note_state.dart';
import 'package:bloc_project/Models/note_model.dart';

//  NOTE BLOC
class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final List<NoteModel> _notes = []; // List NoteModel
  NoteBloc() : super(NoteState()) {
    on<AddNote>(_addNote);
  }
  void _addNote(AddNote event, Emitter<NoteState> emit) {
    _notes.add(event.note);
    emit(state.copyWith(notes: List.from(_notes)));
  }
}
