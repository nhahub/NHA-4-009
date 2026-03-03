import 'package:flutter/material.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'core/networking/paymob_api_constants.dart';
import 'features/app/moodly_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterPaymob.instance.initialize(
    apiKey: PaymobApiConstants.apiKey,
    integrationID: int.parse(PaymobApiConstants.integrationIdCard),
    walletIntegrationId: int.parse(PaymobApiConstants.integrationIdWallet),
    iFrameID: int.parse(PaymobApiConstants.iFrameIdCard),
  );

  runApp(const MoodlyApp());
}
