import 'package:equatable/equatable.dart';

abstract class ConfirmOrderState extends Equatable {
  const ConfirmOrderState();

  @override
  List<Object?> get props => [];
}

class ConfirmOrderInitial extends ConfirmOrderState {}

class ConfirmOrderLoading extends ConfirmOrderState {}

class ConfirmOrderSuccess extends ConfirmOrderState {}

class ConfirmOrderError extends ConfirmOrderState {
  const ConfirmOrderError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}
