import 'package:equatable/equatable.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitialState extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentSuccessState extends PaymentState {
  final String paymentToken;

  const PaymentSuccessState({required this.paymentToken});

  @override
  List<Object?> get props => [paymentToken];
}

class PaymentFailureState extends PaymentState {
  final String errorMessage;

  const PaymentFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
