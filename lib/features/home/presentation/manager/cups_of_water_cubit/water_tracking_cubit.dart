// cups_of_water_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/constants/constants.dart';

import '../../../data/models/water/water_cups_model.dart';
import '../../../data/repos/water_repo.dart';

class WaterTrackingCubit extends Cubit<WaterCupsModel> {
  final WaterRepo _waterRepo;

  WaterTrackingCubit({required WaterRepo waterRepo})
    : _waterRepo = waterRepo,
      super(
        WaterCupsModel(
          currentIndex: 0,
          filledCups: List.generate(kMaxCups, (_) => false),
        ),
      );

  Future<void> getWaterCups() async {
    final WaterCupsModel data = await _waterRepo.getWaterCups();
    emit(data);
  }

  Future<void> fillCurrentCup() async {
    final WaterCupsModel updatedState = await _waterRepo.incrementCup();
    emit(updatedState);
  }

  Future<void> resetDailyCups() async {
    await _waterRepo.resetDailyCups();
    await getWaterCups();
  }
}
