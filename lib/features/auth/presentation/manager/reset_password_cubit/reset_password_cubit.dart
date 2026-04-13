import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../settings/data/repos/settings_repo.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final SettingsRepo _settingsRepo;

  ResetPasswordCubit({required SettingsRepo settingsRepo})
    : _settingsRepo = settingsRepo,
      super(ResetPasswordInitialState());

  Future<void> resetPassword({required String newPassword}) async {
    emit(ResetPasswordLoadingState());
    final Either<Failure, void> response = await _settingsRepo.resetPassword(
      newPassword: newPassword,
    );
    return response.fold(
      (failure) => emit(ResetPasswordFailureState(message: failure.message)),
      (_) => emit(ResetPasswordSuccessState()),
    );
  }
}
