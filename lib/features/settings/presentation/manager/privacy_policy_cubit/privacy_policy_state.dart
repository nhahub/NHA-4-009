part of 'privacy_policy_cubit.dart';

sealed class PrivacyPolicyState extends Equatable {
  const PrivacyPolicyState();

  @override
  List<Object> get props => [];
}

class PrivacyPolicyLoadingState extends PrivacyPolicyState {}

class PrivacyPolicyLoadedState extends PrivacyPolicyState {
  final List<LegalDataModel> data;

  const PrivacyPolicyLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}

class PrivacyPolicyFailureState extends PrivacyPolicyState {
  final String message;

  const PrivacyPolicyFailureState({required this.message});

  @override
  List<Object> get props => [message];
}
