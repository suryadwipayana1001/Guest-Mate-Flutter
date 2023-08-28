import 'package:forecasting/features/result/domain/entities/result_entities.dart';

class ResultModel extends ResultEntities {
  const ResultModel(
      {required int status, required String message, required String data})
      : super(status: status, message: message, data: data);
  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
      status: json['status'], message: json['message'], data: json['data']);
  @override
  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
      };
}
