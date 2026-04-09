part of 'update_profile_cubit.dart';

enum UpdateProfileStatus { initial, loading, success, failure }

extension UpdateProfileStatusX on UpdateProfileStatus {
  bool get isInitial => this == UpdateProfileStatus.initial;
  bool get isLoading => this == UpdateProfileStatus.loading;
  bool get isSuccess => this == UpdateProfileStatus.success;
  bool get isFailure => this == UpdateProfileStatus.failure;
}

class UpdateProfileState extends Equatable {
  final UpdateProfileStatus status;
  final UserDataModel? userDataModel;
  final String? error;
  final File? file;
  final String? phoneNumber;
  final int imageVersion;
  const UpdateProfileState({
    this.userDataModel,
    this.error,
    this.file,
    this.phoneNumber,
    this.imageVersion = 0,
    this.status = UpdateProfileStatus.initial,
  });

  @override
  List<Object?> get props => [
    userDataModel,
    file,
    phoneNumber,
    status,
    error,
    imageVersion,
  ];

  UpdateProfileState copyWith({
    UserDataModel? userDataModel,
    UpdateProfileStatus? status,
    String? error,
    File? file,
    String? phoneNumber,
    int? imageVersion,
  }) {
    return UpdateProfileState(
      userDataModel: userDataModel ?? this.userDataModel,
      error: error,
      file: file ?? this.file,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      imageVersion: imageVersion ?? this.imageVersion,
    );
  }
}
