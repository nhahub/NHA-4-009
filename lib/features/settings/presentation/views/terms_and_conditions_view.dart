import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/dummy/dummy_legal_data.dart';
import '../../data/models/legal_data_model.dart';
import '../manager/terms_cubit/terms_cubit.dart';
import '../widgets/shared/legal_list_view.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Terms & Conditions"),
      body: BlocBuilder<TermsCubit, TermsState>(
        builder: (context, state) {
          switch (state) {
            case TermsLoadingState():
              return LegalListView(
                data: DummyLegalData.dummyTerms,
                isLoading: true,
              );

            case TermsLoadedState(:final List<LegalDataModel> data):
              return LegalListView(data: data);

            case TermsFailuerState(:final String message):
              return Center(child: Text(message));
          }
        },
      ),
    );
  }
}
