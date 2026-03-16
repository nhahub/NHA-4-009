import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paymob/billing_data.dart';
import '../models/stripe/create_customer_input_model.dart';
import '../models/stripe/payment_intent_input_model.dart';
import '../models/stripe/stripe_customer_model/stripe_customer_model.dart';
import '../../../../core/errors/failure.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });

  Future<Either<Failure, StripeCustomerModel>> createCustomer({
    required CreateCustomerInputModel createCustomerInputModel,
  });

  Future<Either<Failure, void>> payWithPaymob({
    required BuildContext context,
    required double amount,
    required BillingData billingData,
  });
}
