import '../../../../core/constants/constants.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/subscription_model.dart';

class SubscriptionRemoteService {
  final SupabaseCRUDService _supabaseCRUDService;

  SubscriptionRemoteService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<SubscriptionModel> createUserSubscription({
    required String type, // monthly / yearly
  }) async {
    final startDate = DateTime.now();
    final endDate = type == 'monthly'
        ? startDate.add(const Duration(days: 30))
        : startDate.add(const Duration(days: 365));

    final subscription = SubscriptionModel(
      userId: getUser()!.userId,
      type: type,
      startDate: startDate,
      endDate: endDate,
      status: 'active',
    );

    final Map<String, dynamic> data = await _supabaseCRUDService
        .upsertDataAndReturnRow(
          table: kSubscriptionsTable,
          data: subscription.toJson(),
          onConflict: 'user_id',
        );

    final SubscriptionModel subscriptionModel = SubscriptionModel.fromJson(
      data,
    );

    return subscriptionModel;
  }

  Future<SubscriptionModel?> getUserSubscription() async {
    final Map<String, dynamic>? data = await _supabaseCRUDService.getSingleRow(
      table: kSubscriptionsTable,
      filters: {"user_id": getUser()!.userId},
    );

    if (data == null) return null;
    final SubscriptionModel subscription = SubscriptionModel.fromJson(data);

    return subscription;
  }

  Future<void> deleteUserSubscription() async {
    await _supabaseCRUDService.deleteData(
      table: kSubscriptionsTable,
      idColumn: "user_id",
      idValue: getUser()!.userId,
    );
  }
}
