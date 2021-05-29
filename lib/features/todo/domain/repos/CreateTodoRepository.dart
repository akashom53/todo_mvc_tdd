import 'package:dartz/dartz.dart';
import 'package:todo_mvc_v1/core/failure.dart';
import 'package:todo_mvc_v1/features/todo/domain/entities/todo.dart';

abstract class CreateTodoRepository {
  Future<Either<Failure, bool>> createTodo(Todo param);
}
