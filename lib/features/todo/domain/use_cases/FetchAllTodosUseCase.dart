import 'package:dartz/dartz.dart';
import 'package:todo_mvc_v1/core/failure.dart';
import 'package:todo_mvc_v1/core/use_case.dart';
import 'package:todo_mvc_v1/features/todo/domain/entities/todo.dart';
import 'package:todo_mvc_v1/features/todo/domain/repos/FetchTodoRepository.dart';

class FetchAllTodosUseCase implements UseCase<List<Todo>, NoParams> {
  final FetchTodoRepository repo;

  FetchAllTodosUseCase(this.repo);

  Future<Either<Failure, List<Todo>>> call([NoParams noParams]) async {
    return repo.fetchTodos();
  }
}
