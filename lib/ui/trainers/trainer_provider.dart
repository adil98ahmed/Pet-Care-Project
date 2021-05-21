import 'package:flutter/widgets.dart';
import 'package:pet_care/models/petServicesModel.dart';
import 'package:pet_care/repositories/pet_features_repository.dart';

class TrainerProvider extends ChangeNotifier {
  List<PetServices> trainers;

  PetFeaturesRepository _petFeatureRepository = PetFeaturesRepository();
  TrainerProvider() {
    getTrainers();
  }

  getTrainers() async {
    trainers = await _petFeatureRepository.getTrainers();
    notifyListeners();
  }
}
