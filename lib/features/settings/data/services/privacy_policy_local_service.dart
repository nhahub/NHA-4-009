import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/legal_data_model.dart';

class PrivacyPolicyLocalService {
  Future<List<LegalDataModel>> getPrivacyPolicy() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/legal/privacy_policy.json',
    );

    final Map<String, dynamic> decoded = json.decode(jsonString);

    final List data = decoded['privacyPolicyData'];

    return data.map((e) => LegalDataModel.fromJson(e)).toList();
  }
}
