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

  Future<bool> checkSubscription() async {
    final localStatus = _local.getSubscription()?.status;
    final localEndDate = _local.getSubscription()?.endDate;

    if (localStatus != null && localEndDate != null) {
      final isActive = _isLocalActive(localStatus, localEndDate);

      if (!isActive) {
        await _remote.deleteUserSubscription();
      }

      return isActive;
    }

    final SubscriptionModel? remoteSub = await _remote.getUserSubscription();

    if (remoteSub != null) {
      await _local.cacheSubscription(subscriptionModel: remoteSub);

      return _isLocalActive(remoteSub.status, remoteSub.endDate);
    }

    return false;
  }

  Future<void> createSubscription({required String type}) async {
    final SubscriptionModel sub = await _remote.createUserSubscription(
      type: type,
    );
    await _local.cacheSubscription(subscriptionModel: sub);
  }

  bool _isLocalActive(String status, DateTime endDate) {
    if (DateTime.now().isAfter(endDate)) {
      _local.markInactive();
      return false;
    }

    return status == 'active';
  }
}
