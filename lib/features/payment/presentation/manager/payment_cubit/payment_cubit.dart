import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/billing_data.dart';
import 'package:moodly/core/errors/failure.dart';
import '../../../data/models/stripe/payment_intent_input_model.dart';
import '../../../data/repos/payment_repo.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo paymentRepo;

  PaymentCubit({required this.paymentRepo}) : super(PaymentInitialState());

  Future<void> initiatePaymobPayment({
    required BuildContext context,
    required double amount,
    required BillingData billingData,
  }) async {
    emit(PaymentLoadingState());

    final result = await paymentRepo.payWithPaymob(
      context: context,
      amount: amount,
      billingData: billingData,
    );

    result.fold(
      (failure) => emit(PaymentFailureState(errorMessage: failure.message)),
      (_) =>
          emit(const PaymentSuccessState(paymentToken: "Payment Successful")),
    );
  }

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoadingState());

    Either<Failure, void> response = await paymentRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    return response.fold(
      (failure) => emit(PaymentFailureState(errorMessage: failure.message)),
      (success) =>
          emit(const PaymentSuccessState(paymentToken: "Payment Successful")),
    );
  }
}
