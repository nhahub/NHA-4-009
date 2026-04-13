import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/subscription_model.dart';
import '../services/subscription_local_service.dart';
import '../services/subscription_remote_service.dart';

class SubscriptionRepo {
  final SubscriptionLocalService _local;
  final SubscriptionRemoteService _remote;

  SubscriptionRepo({
    required SubscriptionLocalService local,
    required SubscriptionRemoteService remote,
  }) : _remote = remote,
       _local = local;

  Future<Either<Failure, bool>> checkSubscription() async {
    try {
      final localStatus = _local.getSubscription()?.status;
      final localEndDate = _local.getSubscription()?.endDate;

      if (localStatus != null && localEndDate != null) {
        final isActive = _isLocalActive(localStatus, localEndDate);

        if (!isActive) {
          await _remote.deleteUserSubscription();
        }

        return right(isActive);
      }

      final SubscriptionModel? remoteSub = await _remote.getUserSubscription();

      if (remoteSub != null) {
        await _local.cacheSubscription(subscriptionModel: remoteSub);

        return right(_isLocalActive(remoteSub.status, remoteSub.endDate));
      }

      return right(false);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> createSubscription({
    required String type,
  }) async {
    try {
      final SubscriptionModel sub = await _remote.createUserSubscription(
        type: type,
      );

      await _local.cacheSubscription(subscriptionModel: sub);

      return right(null);
    } catch (e) {
      Logger.log("Error creating subscription: $e");
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  bool _isLocalActive(String status, DateTime endDate) {
    if (DateTime.now().isAfter(endDate)) {
      _local.markInactive();
      return false;
    }

    return status == 'active';
  }
}
