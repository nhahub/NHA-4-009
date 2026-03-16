import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:moodly/features/payment/data/models/stripe/payment_intent_input_model.dart';
import 'package:moodly/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';

void executeStripePayment({
  required BuildContext context,
  required String amount,
}) {
  context.read<PaymentCubit>().makePayment(
    paymentIntentInputModel: PaymentIntentInputModel(
      amount: amount,
      currency: 'USD',
      customerId: getUser()!.userId,
    ),
  );
}
