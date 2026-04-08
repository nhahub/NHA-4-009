import 'dart:io';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/models/user_data_model.dart';
import 'package:moodly/core/services/supabase_crud_service.dart';
import 'package:moodly/core/services/supabase_storage_service.dart';
import '../../../../core/functions/user_data_local.dart';

class ProfileImageService {
  final SupabaseStorageService supabaseStorageService;
  final SupabaseCRUDService supabaseCRUDService;
  ProfileImageService({
    required this.supabaseStorageService,
    required this.supabaseCRUDService,
  });

  Future<String> uploadProfileImageToStorage({required File imageFile}) async {
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

  Future<void> updateCachedUserProfilePicture({
    required String newPictureUrl,
  }) async {
    final UserDataModel newUserData = getUser()!.copyWith(
      picture: newPictureUrl,
    );
    return await saveUserDataLocal(userDataModel: newUserData);
  }
}
