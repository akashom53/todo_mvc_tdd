import 'package:dartz/dartz.dart';
import 'package:todo_mvc_v1/core/failure.dart';
import 'package:todo_mvc_v1/features/todo/domain/entities/todo.dart';

abstract class FetchTodoRepository {
  Future<Either<Failure, List<Todo>>> fetchTodos();

  Future<Either<Failure, List<Todo>>> fetchFilteredTodos(bool isComplete);
}
