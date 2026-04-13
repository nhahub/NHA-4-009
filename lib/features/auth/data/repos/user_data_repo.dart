import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/models/user_data_model.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../services/user_data_service.dart';

class UserDataRepo {
  final UserDataService _userDataService;
  UserDataRepo({required UserDataService userDataService})
    : _userDataService = userDataService;

  Future<Either<Failure, bool>> isUserExists() async {
    try {
      final bool response = await _userDataService.isUserExists();
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, UserDataModel>> updateUserData({
    required UserDataModel userDataModel,
  }) async {
    try {
      final UserDataModel response = await _userDataService.updateUserData(
        userDataModel: userDataModel,
      );
      saveUserDataLocal(userDataModel: userDataModel);
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, UserDataModel?>> getUserData() async {
    try {
      final UserDataModel? response = await _userDataService.getUserData();
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> updateUserFields({
    String? name,
    String? phone,
    String? picture,
    bool? isOldUser,
  }) async {
    try {
      await _userDataService.updateUserFields(
        name: name,
        phone: phone,
        picture: picture,
        isOldUser: isOldUser,
      );
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
