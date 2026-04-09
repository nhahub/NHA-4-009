import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/repos/update_profile_repo.dart';
import '../../helpers/image_picker_helper.dart';
import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/models/user_data_model.dart';
import 'package:path_provider/path_provider.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepo updateProfileRepo;

  UpdateProfileCubit({required this.updateProfileRepo})
    : super(UpdateProfileState(userDataModel: getUser()));

  void updatePhoneNumber(String? phone) {
    emit(
      state.copyWith(phoneNumber: phone, status: UpdateProfileStatus.initial),
    );
  }

  Future<void> pickProfileImageFromGallery() async {
    final File? file = await pickImageFromGallery();
    final File safe = await _safeFile(file ?? File(''));
    emit(state.copyWith(status: UpdateProfileStatus.initial, file: safe));
  }

  Future<void> updateProfile({String? name, String? phone, File? file}) async {
    emit(state.copyWith(status: UpdateProfileStatus.loading));

    final Either<Failure, UserDataModel?> result = await updateProfileRepo
        .updateProfile(name: name, phone: phone, file: file);

    result.fold(
      (failure) {
        return emit(
          state.copyWith(
            status: UpdateProfileStatus.failure,
            error: failure.message,
          ),
        );
      },
      (updatedUser) {
        return emit(
          state.copyWith(
            userDataModel: updatedUser ?? state.userDataModel,
            imageVersion: state.imageVersion + 1,
            status: UpdateProfileStatus.success,
          ),
        );
      },
    );
  }

  Future<File> _safeFile(File file) async {
    final dir = await getApplicationDocumentsDirectory();
    final newPath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    return await file.copy(newPath);
  }
}
