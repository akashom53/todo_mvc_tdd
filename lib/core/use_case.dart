import 'package:dartz/dartz.dart';
import 'package:todo_mvc_v1/core/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}


class NoParams{}