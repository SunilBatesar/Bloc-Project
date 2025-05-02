import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class NoteModel extends Equatable {
  String? id;
  String? title;
  String? description;
  NoteModel({this.id, this.title, this.description});

  @override
  List<Object?> get props => [id, title, description];
}
