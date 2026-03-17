import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paymob/billing_data.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:moodly/core/helpers/logger.dart';
import 'package:moodly/features/payment/data/services/paymob_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../models/stripe/create_customer_input_model.dart';
import '../models/stripe/payment_intent_input_model.dart';
import '../models/stripe/stripe_customer_model/stripe_customer_model.dart';
import '../services/stripe_service.dart';
import 'payment_repo.dart';

class PaymentRepoImp extends PaymentRepo {
  final StripeService stripeService;
  final PaymobService paymobService;

  PaymentRepoImp({required this.stripeService, required this.paymobService});

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on StripeException catch (e) {
      final String msg = e.error.message ?? "Payment failed. Please try again.";
      return left(ApiErrorModel(message: msg));
    } catch (e) {
      Logger.log(e.toString());
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  @override
  Future<Either<Failure, StripeCustomerModel>> createCustomer({
    required CreateCustomerInputModel createCustomerInputModel,
  }) async {
    try {
      final StripeCustomerModel response = await stripeService.createCustomer(
        createCustomerInputModel: createCustomerInputModel,
      );
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  @override
  Future<Either<Failure, void>> payWithPaymob({
    required BuildContext context,
    required double amount,
    required BillingData billingData,
  }) async {
    try {
      await paymobService.payWithCard(
        context: context,
        amount: amount,
        onResult: (success, message) {
          if (!success) {
            throw Exception(message ?? "Payment Failed");
          }
        },
        billingData: billingData,
      );

      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
