import 'package:bloc_project/Models/note_model.dart';
import 'package:equatable/equatable.dart';

// NOTE EVENT
abstract class NoteEvent extends Equatable {
  const NoteEvent();
  @override
  List<Object?> get props => [];
}

// AddNote event to add a note
class AddNote extends NoteEvent {
  final NoteModel note;
  const AddNote({required this.note});
  @override
  List<Object> get props => [note];
}
