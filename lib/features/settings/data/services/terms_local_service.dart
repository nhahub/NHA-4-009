import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/legal_data_model.dart';

class TermsLocalService {
  Future<List<LegalDataModel>> getTerms() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/legal/terms.json',
    );

    final Map<String, dynamic> decoded = json.decode(jsonString);

    final List data = decoded['termsData'];

    return data.map((e) => LegalDataModel.fromJson(e)).toList();
  }
}
