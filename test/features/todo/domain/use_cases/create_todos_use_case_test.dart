import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_mvc_v1/core/failure.dart';
import 'package:todo_mvc_v1/features/todo/domain/entities/todo.dart';
import 'package:todo_mvc_v1/features/todo/domain/repos/CreateTodoRepository.dart';
import 'package:todo_mvc_v1/features/todo/domain/use_cases/CreateTodosUseCase.dart';

class MockCreateTodoRepository extends Mock implements CreateTodoRepository {}

void main() {
  CreateTodosUseCase createTodos;
  CreateTodoRepository repo;

  setUp(() {
    repo = MockCreateTodoRepository();
    createTodos = CreateTodosUseCase(repo);
  });

  test("Create a Todo: Success", () async {
    //Create Sample Data
    when(repo.createTodo(any)).thenAnswer((realInvocation) async {
      return Right(true);
    });

    //Perform Action
    final result = await createTodos(Todo("Title", false));
    expect(result, Right(true));
    verify(repo.createTodo(Todo("Title", false)));
    verifyNoMoreInteractions(repo);
  });

  test("Create a Todo: Failure", () async {
    //Create Sample Data
    when(repo.createTodo(any)).thenAnswer((realInvocation) async {
      return Left(Failure(["Test Exception"]));
    });

    //Perform Action
    final result = await createTodos(Todo("Title", false));
    expect(result, Left(Failure(["Test Exception"])));
    verify(repo.createTodo(Todo("Title", false)));
    verifyNoMoreInteractions(repo);
  });
}
