import 'package:dartz/dartz.dart';
import 'package:forecasting/features/result/data/repository/result_repository.dart';

import '../../../../core/core.dart';

abstract class ResultUseCase<Type> {
  Future<Either<Failure, dynamic>> call(
      Map<String, dynamic> data, String params);
}

class ResultQuestation implements ResultUseCase {
  final ResultRepository repository;
  ResultQuestation(this.repository);

  Future<Either<Failure, dynamic>> call(
      Map<String, dynamic> data, String params) async {
    return await repository.getResult(data, params);
  }
}
