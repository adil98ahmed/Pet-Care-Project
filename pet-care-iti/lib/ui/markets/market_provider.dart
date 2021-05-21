import 'package:flutter/widgets.dart';
import 'package:pet_care/models/petServicesModel.dart';
import 'package:pet_care/repositories/pet_features_repository.dart';

class MarketProvider extends ChangeNotifier {
  List<PetServices> markets;

  PetFeaturesRepository _petFeatureRepository = PetFeaturesRepository();
  MarketProvider() {
    getTrainers();
  }

  getTrainers() async {
    markets = await _petFeatureRepository.getMarkets();
    notifyListeners();
  }
}
