import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/models/user_data_model.dart';
import '../../../auth/data/services/user_data_service.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../../../../core/services/supabase_storage_service.dart';
import '../../../../core/errors/failure.dart';

class UpdateProfileRepo {
  final UserDataService userDataService;
  final SupabaseStorageService supabaseStorageService;
  final SupabaseCRUDService supabaseCRUDService;

  UpdateProfileRepo({
    required this.userDataService,
    required this.supabaseStorageService,
    required this.supabaseCRUDService,
  });

  Future<Either<Failure, UserDataModel?>> updateProfile({
    String? name,
    String? phone,
    File? file,
  }) async {
    try {
      String? imageUrl;

      if (file != null) {
        imageUrl = await _uploadProfileImageToStorage(imageFile: file);
      }

      await userDataService.updateUserFields(
        name: name,
        phone: phone,
        picture: imageUrl == getUser()?.picture ? null : imageUrl,
      );

      final UserDataModel uploadResult = await _updateCachedUserProfilePicture(
        newPictureUrl: imageUrl,
        newName: name,
        newPhone: phone,
      );

      return right(uploadResult);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<String> _uploadProfileImageToStorage({required File imageFile}) async {
    final String userId = supabaseCRUDService.getCurrentUserId()!;
    final String filePath = "$kProfileImagesPath/$userId.jpg";

    await supabaseStorageService.uploadFile(
      file: imageFile,
      bucketName: kUsersImagesBucket,
      filePath: filePath,
    );

    final String publicUrl = supabaseStorageService.getFileUrl(
      filePath: filePath,
      bucketName: kUsersImagesBucket,
    );

    return publicUrl;
  }

  Future<UserDataModel> _updateCachedUserProfilePicture({
    String? newPictureUrl,
    String? newName,
    String? newPhone,
  }) async {
    final UserDataModel newUserData = getUser()!.copyWith(
      picture: newPictureUrl,
      name: newName,
      phone: newPhone,
    );
    await saveUserDataLocal(userDataModel: newUserData);
    return newUserData;
  }
}
