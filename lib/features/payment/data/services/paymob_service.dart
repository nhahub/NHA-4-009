import 'package:flutter/material.dart';
import 'package:flutter_paymob/billing_data.dart';
import 'package:flutter_paymob/flutter_paymob.dart';

import '../../../../core/constants/app_keys.dart';

class PaymobService {
  static Future<void> init() async {
    await FlutterPaymob.instance.initialize(
      apiKey: ApiKeys.paymobApiKey,
      integrationID: int.parse(ApiKeys.integrationIdCard),
      walletIntegrationId: int.parse(ApiKeys.integrationIdWallet),
      iFrameID: int.parse(ApiKeys.iFrameIdCard),
    );
  }

  Future<void> payWithCard({
    required BuildContext context,
    required double amount,
    required BillingData billingData,
    required Function(bool success, String? message) onResult,
  }) async {
    FlutterPaymob.instance.payWithCard(
      context: context,
      currency: "EGP",
      amount: amount,
      billingData: billingData,
      onPayment: (response) {
        onResult(response.success, response.message);
      },
    );
  }
}
