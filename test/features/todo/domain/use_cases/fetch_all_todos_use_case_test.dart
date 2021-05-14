import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_mvc_v1/core/failure.dart';
import 'package:todo_mvc_v1/features/todo/domain/entities/todo.dart';
import 'package:todo_mvc_v1/features/todo/domain/repos/FetchTodoRepository.dart';
import 'package:todo_mvc_v1/features/todo/domain/use_cases/FetchAllTodosUseCase.dart';

class MockFetchTodoRepository extends Mock implements FetchTodoRepository {}

void main() {
  FetchAllTodosUseCase fetchAllTodos;
  MockFetchTodoRepository repo;

  setUp(() {
    repo = MockFetchTodoRepository();
    fetchAllTodos = FetchAllTodosUseCase(repo);
  });

  test("Fetch all todos: Success with 5 entries", () async {
    // Create Sample Data
    final sampleTodoList =
        List<Todo>.generate(5, (index) => Todo("Todo $index", false));

    when(repo.fetchTodos()).thenAnswer((_) async {
      return Right(sampleTodoList);
    });

    // Perform Action
    final result = await fetchAllTodos();
    expect(result, Right(sampleTodoList));
    verify(repo.fetchTodos());
    verifyNoMoreInteractions(repo);
  });

  test("Fetch all todos: Exception", () async {
    when(repo.fetchTodos()).thenAnswer((_) async {
      return Left(Failure(["Test Reason"]));
    });

    // Perform Action
    final result = await fetchAllTodos();
    expect(result, Left(Failure(["Test Reason"])));
    verify(repo.fetchTodos());
    verifyNoMoreInteractions(repo);
  });
}
