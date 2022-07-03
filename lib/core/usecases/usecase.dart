import 'package:dartz/dartz.dart';
import 'package:untitled/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure?, T>> call(P params);
}

class NoParams {}
