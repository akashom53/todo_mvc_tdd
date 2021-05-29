import 'package:dartz/dartz.dart';
import 'package:todo_mvc_v1/core/failure.dart';
import 'package:todo_mvc_v1/core/use_case.dart';
import 'package:todo_mvc_v1/features/todo/domain/entities/todo.dart';
import 'package:todo_mvc_v1/features/todo/domain/repos/FetchTodoRepository.dart';

class FetchFilteredTodosUseCase implements UseCase<List<Todo>, bool> {
  final FetchTodoRepository repo;

  FetchFilteredTodosUseCase(this.repo);

  @override
  Future<Either<Failure, List<Todo>>> call(bool isComplete) {
    return repo.fetchFilteredTodos(isComplete);
  }
}
