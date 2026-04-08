import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';
import 'package:moodly/features/settings/data/repos/profile_image_service.dart';

import '../../../../core/errors/failure.dart';

class ProfileRepo {
  final UserDataRepo userDataRepo;
  final ProfileImageService profileImageService;

  ProfileRepo({required this.userDataRepo, required this.profileImageService});

  Future<Either<Failure, String>> updateProfileImage(File image) async {
    try {
      // 1. upload image
      final String uploadResult = await profileImageService
          .uploadProfileImageToStorage(imageFile: image);

      // 2. update DB
      await userDataRepo.updateUserFields(picture: uploadResult);

      // 3. update local cache
      await profileImageService.updateCachedUserProfilePicture(
        newPictureUrl: uploadResult,
      );

      return right(uploadResult);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
