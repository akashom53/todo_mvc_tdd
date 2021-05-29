import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String title;
  final bool isCompleted;

  Todo(this.title, this.isCompleted) : super([title, isCompleted]);
}
