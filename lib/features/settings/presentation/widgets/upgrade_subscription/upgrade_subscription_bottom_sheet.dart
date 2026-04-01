import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../payment/data/models/payment_types_model.dart';
import '../../../../payment/data/models/subscription_model.dart';
import '../../../../payment/data/services/subscription_local_service.dart';
import 'current_plan_card.dart';
import 'monthly_subscribe_button.dart';
import 'normal_subscribe_button.dart';
import 'upgrade_card.dart';
import 'yearly_status.dart';
import 'yearly_subscribe_button.dart';

class UpgradeSubscriptionBottomSheet extends StatefulWidget {
  const UpgradeSubscriptionBottomSheet({super.key});

  @override
  State<UpgradeSubscriptionBottomSheet> createState() =>
      _UpgradeSubscriptionBottomSheetState();
}

class _UpgradeSubscriptionBottomSheetState
    extends State<UpgradeSubscriptionBottomSheet> {
  SubscriptionModel? subscriptionModel;
  bool isMonthly = false;
  bool isYearly = false;
  bool isNormal = false;

  @override
  void initState() {
    SubscriptionLocalService localService = getIt
        .get<SubscriptionLocalService>();
    subscriptionModel = localService.getSubscription();
    isMonthly = subscriptionModel?.type == "monthly";
    isYearly = subscriptionModel?.type == "yearly";
    isNormal = subscriptionModel == null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const types = paymentTypes;
    final yearly = paymentTypes[1];
    final monthly = paymentTypes[0];
    final double finalYearlyPrice = PaymentTypesModel.getFinalPrice(yearly);
    final double finalMonthlyPrice = PaymentTypesModel.getFinalPrice(monthly);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          CurrentPlanCard(
            subscriptionModel: subscriptionModel,
            types: types,
            isNormal: isNormal,
          ),
          const SizedBox(height: 20),
          if (isMonthly)
            UpgradeCard(
              finalYearlyPrice: finalYearlyPrice,
              discount: yearly.discount ?? '',
            ),
          if (isYearly) const YearlyStatus(),
          const SizedBox(height: 20),
          if (isNormal) const NormalSubscribeButton(),
          if (isMonthly)
            MonthlySubscribeButton(finalYearlyPrice: finalYearlyPrice),
          if (isYearly)
            YearlySubscribeButton(finalMonthlyPrice: finalMonthlyPrice),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
