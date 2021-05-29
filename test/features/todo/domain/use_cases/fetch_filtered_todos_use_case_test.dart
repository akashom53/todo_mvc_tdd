import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_mvc_v1/core/failure.dart';
import 'package:todo_mvc_v1/features/todo/domain/entities/todo.dart';
import 'package:todo_mvc_v1/features/todo/domain/repos/FetchTodoRepository.dart';
import 'package:todo_mvc_v1/features/todo/domain/use_cases/FetchFilteredTodosUseCase.dart';

class MockFetchTodoRepository extends Mock implements FetchTodoRepository {}

void main() {
  FetchFilteredTodosUseCase fetchFilteredTodos;
  MockFetchTodoRepository repo;

  setUp(() {
    repo = MockFetchTodoRepository();
    fetchFilteredTodos = FetchFilteredTodosUseCase(repo);
  });

  test("Fetch Filtered todo: Completed Todos", () async {
    // Create Sample Data
    final sampleTodoList =
        List<Todo>.generate(5, (index) => Todo("title", true));

    when(repo.fetchFilteredTodos(any)).thenAnswer((realInvocation) async {
      return Right(sampleTodoList);
    });

    // Perform Action
    final result = await fetchFilteredTodos(true);
    expect(result, Right(sampleTodoList));
    verify(repo.fetchFilteredTodos(true));
    verifyNoMoreInteractions(repo);
  });

  test("Fetch Filtered todo: UnCompleted Todos", () async {
    // Create Sample Data
    final sampleTodoList =
        List<Todo>.generate(5, (index) => Todo("title", false));

    when(repo.fetchFilteredTodos(any)).thenAnswer((realInvocation) async {
      return Right(sampleTodoList);
    });

    // Perform Action
    final result = await fetchFilteredTodos(false);
    expect(result, Right(sampleTodoList));
    verify(repo.fetchFilteredTodos(false));
    verifyNoMoreInteractions(repo);
  });

  test("Fetch Filtered todo: Completed Exception", () async {
    // Create Sample Data
    when(repo.fetchFilteredTodos(any)).thenAnswer((realInvocation) async {
      return Left(Failure(["Test Exception"]));
    });

    // Perform Action
    final result = await fetchFilteredTodos(true);
    expect(result, Left(Failure(["Test Exception"])));
    verify(repo.fetchFilteredTodos(true));
    verifyNoMoreInteractions(repo);
  });

  test("Fetch Filtered todo: UnCompleted Exception", () async {
    // Create Sample Data
    when(repo.fetchFilteredTodos(any)).thenAnswer((realInvocation) async {
      return Left(Failure(["Test Exception"]));
    });

    // Perform Action
    final result = await fetchFilteredTodos(false);
    expect(result, Left(Failure(["Test Exception"])));
    verify(repo.fetchFilteredTodos(false));
    verifyNoMoreInteractions(repo);
  });
}
