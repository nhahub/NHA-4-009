import 'package:flutter/material.dart';
import 'package:moodly/features/main/presentation/widgets/chatbot_providers_wrapper.dart';
import 'package:moodly/features/main/presentation/widgets/community_providers_wrapper.dart';
import 'package:moodly/features/main/presentation/widgets/meditations_providers_wrapper.dart';
import '../widgets/home_providers_wrapper.dart';
import '../widgets/profile_providers_wrapper.dart';

class MainScreens {
  static List<Widget> build({required bool isPremium}) {
    return [
      HomeProvidersWrapper(isPremium: isPremium),
      CommunityProvidersWrapper(isPremium: isPremium),
      MeditationsProvidersWrapper(isPremium: isPremium),
      ChatbotProvidersWrapper(isPremium: isPremium),
      ProfileProvidersWrapper(isPremium: isPremium),
    ];
  }
}
