import 'package:dio/dio.dart';
import 'package:forecasting/features/result/data/model/result_model.dart';

abstract class ResultDatasource {
  Future<ResultModel> getResult(Map<String, dynamic> data, String params);
}

class ResultDataSourceImplementation implements ResultDatasource {
  final Dio dio;
  ResultDataSourceImplementation({required this.dio});

  Future<ResultModel> getResult(
      Map<String, dynamic> data, String params) async {
    String path = params;
    try {
      final response = await dio.post(path, data: data);
      return ResultModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
