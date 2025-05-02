import 'package:bloc_project/Models/note_model.dart';
import 'package:equatable/equatable.dart';

// NOTE STATE
class NoteState extends Equatable {
  final List<NoteModel> notes; // List of NoteModel
  const NoteState({this.notes = const []});
  @override
  List<Object?> get props => [notes];

  // copyWith method
  NoteState copyWith({List<NoteModel>? notes}) {
    return NoteState(notes: notes ?? this.notes);
  }
}
