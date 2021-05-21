import 'package:flutter/widgets.dart';
import 'package:pet_care/models/petServicesModel.dart';
import 'package:pet_care/repositories/pet_features_repository.dart';

class PharmacyProvider extends ChangeNotifier {
  List<PetServices> pharmacies;

  PetFeaturesRepository _petFeatureRepository = PetFeaturesRepository();
  PharmacyProvider() {
    getPharmacies();
  }

  getPharmacies() async {
    pharmacies = await _petFeatureRepository.getPharmacies();
    notifyListeners();
  }
}
