part of 'activities_cubit.dart';

enum ActivitiesStatus { loading, success, failure }

extension ActivitiesStatusX on ActivitiesStatus {
  bool get isLoading => this == ActivitiesStatus.loading;
  bool get isSuccess => this == ActivitiesStatus.success;
  bool get isFailure => this == ActivitiesStatus.failure;
}

class ActivitiesState extends Equatable {
  final ActivitiesStatus status;
  final List<ActivityCategoryModel>? categories;
  final List<ActivityModel>? activities;
  final String? error;

  const ActivitiesState({
    this.categories,
    this.activities,
    this.error,
    this.status = ActivitiesStatus.loading,
  });

  @override
  List<Object?> get props => [categories, activities, error, status];

  ActivitiesState copyWith({
    List<ActivityCategoryModel>? categories,
    List<ActivityModel>? activities,
    String? error,
    ActivitiesStatus? status,
  }) {
    return ActivitiesState(
      categories: categories ?? this.categories,
      activities: activities ?? this.activities,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}
