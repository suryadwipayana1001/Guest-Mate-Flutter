import 'package:dio/dio.dart';
import 'package:forecasting/features/result/data/datasource/result_datasource.dart';
import 'package:forecasting/features/result/data/model/result_model.dart';
import '../../../../core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';

abstract class ResultRepository {
  Future<Either<Failure, ResultModel>> getResult(
      Map<String, dynamic> data, String params);
}

class ResultRepositorImplementation implements ResultRepository {
  final ResultDatasource dataSource;
  final NetworkInfo networkInfo;

  ResultRepositorImplementation(
      {required this.dataSource, required this.networkInfo});
  @override
  Future<Either<Failure, ResultModel>> getResult(
      Map<String, dynamic> data, String params) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dataSource.getResult(data, params);
        return Right(response);
      } on DioError catch (e) {
        return Left(
          ServerFailure(message: e.response!.data),
        );
      }
    }
    return const Left(ServerFailure());
  }
}
