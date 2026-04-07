import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/models/user_data_model.dart';
import 'package:moodly/core/services/supabase_crud_service.dart';

class UserDataService {
  final SupabaseCRUDService supabaseCRUDService;

  UserDataService({required this.supabaseCRUDService});

  Future<UserDataModel> updateUserData({
    required UserDataModel userDataModel,
  }) async {
    final Map<String, dynamic> userData = await supabaseCRUDService
        .upsertDataAndReturnRow(
          table: kUserDataTable,
          data: userDataModel.toJson(),
          onConflict: 'id',
        );
    return UserDataModel.fromJson(userData);
  }

  Future<void> updateisOldUserField({required bool isOldUser}) async {
    await supabaseCRUDService.updateData(
      table: kUserDataTable,
      data: {"is_old_user": isOldUser},
      idColumn: 'id',
      idValue: supabaseCRUDService.getCurrentUserId(),
    );
  }

  Future<void> updateNameField({required String name}) async {
    await supabaseCRUDService.updateData(
      table: kUserDataTable,
      data: {"name": name},
      idColumn: 'id',
      idValue: supabaseCRUDService.getCurrentUserId(),
    );
  }

  Future<void> updatePhoneField({required String phone}) async {
    await supabaseCRUDService.updateData(
      table: kUserDataTable,
      data: {"phone": phone},
      idColumn: 'id',
      idValue: supabaseCRUDService.getCurrentUserId(),
    );
  }

  Future<void> updatePictureField({required String picture}) async {
    await supabaseCRUDService.updateData(
      table: kUserDataTable,
      data: {"picture": picture},
      idColumn: 'id',
      idValue: supabaseCRUDService.getCurrentUserId(),
    );
  }

  Future<UserDataModel?> getUserData() async {
    final Map<String, dynamic>? userData = await supabaseCRUDService
        .getSingleRow(
          table: kUserDataTable,
          whereColumn: "id",
          whereValue: supabaseCRUDService.getCurrentUserId(),
        );

    return UserDataModel?.fromJson(userData!);
  }

  Future<bool> isUserExists() async {
    final bool response = await supabaseCRUDService.isRowExists(
      table: kUserDataTable,
      column: "id",
      value: supabaseCRUDService.getCurrentUserId(),
    );
    return response;
  }
}
