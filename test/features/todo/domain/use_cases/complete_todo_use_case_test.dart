import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_mvc_v1/core/failure.dart';
import 'package:todo_mvc_v1/features/todo/domain/entities/todo.dart';
import 'package:todo_mvc_v1/features/todo/domain/repos/CompleteTodoRepository.dart';
import 'package:todo_mvc_v1/features/todo/domain/use_cases/CompleteTodoUseCase.dart';

class MockCompleteTodoRepository extends Mock
    implements CompleteTodoRepository {}

void main() {
  CompleteTodoUseCase completeTodo;
  MockCompleteTodoRepository repo;
  setUp(() {
    repo = MockCompleteTodoRepository();
    completeTodo = CompleteTodoUseCase(repo);
  });

  test("Completing a Todo: Success", () async {
    //Create Sample Data
    when(repo.completeTodo(any)).thenAnswer((realInvocation) async {
      return Right(true);
    });

    //Perform Action
    final result = await completeTodo(Todo("Title", true));
    expect(result, Right(true));
    verify(repo.completeTodo(Todo("Title", true)));
    verifyNoMoreInteractions(repo);
  });

  test("Completing a Todo: Failure", () async {
    //Create Sample Data
    when(repo.completeTodo(any)).thenAnswer((realInvocation) async {
      return Left(Failure(["Test Exception"]));
    });

    //Perform Action
    final result = await completeTodo(Todo("Title", true));
    expect(result, Left(Failure(["Test Exception"])));
    verify(repo.completeTodo(Todo("Title", true)));
    verifyNoMoreInteractions(repo);
  });
}
