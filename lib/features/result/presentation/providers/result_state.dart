import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';

abstract class ResultState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResultLoading extends ResultState {}

// class ResultNama extends ResultState {}

// class ResultKriteria extends ResultState {}

// class ResultPekerjaan extends ResultState {}

// class ResultTanggal extends ResultState {}

// class ResultAnak extends ResultState {}

class ResultSuccess extends ResultState {
  ResultSuccess();
}

class ResultFailure extends ResultState {
  final Failure error;

  ResultFailure({required this.error});
  @override
  List<Object?> get props => [error];
}
