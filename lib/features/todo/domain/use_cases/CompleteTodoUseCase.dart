import 'package:dartz/dartz.dart';
import 'package:todo_mvc_v1/core/failure.dart';
import 'package:todo_mvc_v1/core/use_case.dart';
import 'package:todo_mvc_v1/features/todo/domain/entities/todo.dart';
import 'package:todo_mvc_v1/features/todo/domain/repos/CompleteTodoRepository.dart';

class CompleteTodoUseCase implements UseCase<bool, Todo> {
  final CompleteTodoRepository repo;

  CompleteTodoUseCase(this.repo);

  @override
  Future<Either<Failure, bool>> call(Todo param) {
    return repo.completeTodo(param);
  }
}
