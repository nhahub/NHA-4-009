import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';
import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/user_data_model.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UserDataRepo userDataRepo;

  UpdateProfileCubit({required this.userDataRepo})
    : super(UpdateProfileState(userDataModel: getUser()));

  String? phoneNumber;

  void setPhoneNumber(String number) {
    phoneNumber = number;
  }

  Future<void> updateUserFields({
    String? name,
    String? phone,
    String? picture,
    bool? isOldUser,
  }) async {
    final UserDataModel? currentUser = state.userDataModel;
    emit(UpdateProfileState(userDataModel: currentUser, isLoading: true));
    final Either<Failure, void> response = await userDataRepo.updateUserFields(
      name: name,
      phone: phone,
      picture: picture,
      isOldUser: isOldUser,
    );
    response.fold(
      (failure) => emit(
        UpdateProfileState(
          userDataModel: currentUser,
          isLoading: false,
          error: failure.message,
        ),
      ),
      (_) {
        if (currentUser == null) return;
        final UserDataModel updatedUserData = currentUser.copyWith(
          name: name ?? currentUser.name,
          phone: phone ?? currentUser.phone,
          picture: picture ?? currentUser.picture,
          isOldUser: isOldUser ?? currentUser.isOldUser,
        );
        saveUserDataLocal(userDataModel: updatedUserData);
        emit(
          UpdateProfileState(userDataModel: updatedUserData, isLoading: false),
        );
      },
    );
  }
}
