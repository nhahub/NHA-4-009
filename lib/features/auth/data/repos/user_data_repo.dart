import 'package:dartz/dartz.dart';
import 'package:moodly/core/functions/user_data_local.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:moodly/features/auth/data/services/user_data_service.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/user_data_model.dart';

class UserDataRepo {
  UserDataService userDataService;
  UserDataRepo({required this.userDataService});

  Future<Either<Failure, UserDataModel>> updateUserData({
    required UserDataModel userDataModel,
  }) async {
    try {
      final UserDataModel response = await userDataService.updateUserData(
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
      final UserDataModel? response = await userDataService.getUserData();
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> updateisOldUserField({
    required bool isOldUser,
  }) async {
    try {
      await userDataService.updateisOldUserField(isOldUser: isOldUser);
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> updateNameField({required String name}) async {
    try {
      await userDataService.updateNameField(name: name);
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> updatePhoneField({
    required String phone,
  }) async {
    try {
      await userDataService.updatePhoneField(phone: phone);
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> updatePictureField({
    required String picture,
  }) async {
    try {
      await userDataService.updatePictureField(picture: picture);
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, bool>> isUserExists() async {
    try {
      final bool response = await userDataService.isUserExists();
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
