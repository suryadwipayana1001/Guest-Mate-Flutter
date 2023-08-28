import 'package:equatable/equatable.dart';

class ResultEntities extends Equatable {
  final int status;
  final String message;
  final String data;
  const ResultEntities(
      {required this.status, required this.message, required this.data});
  @override
  List<Object?> get props => [status, message, data];
  toJson() {}
}
