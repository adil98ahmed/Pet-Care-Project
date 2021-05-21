import 'package:pet_care/models/petServicesModel.dart';
import 'package:pet_care/services/pet_features_service.dart';

class PetFeaturesRepository {
  PetFeatureService _petFeatureService = PetFeatureService();
  Future getDoctors() {
    return _petFeatureService.getDoctors();
  }

  Future getGroomings() {
    return _petFeatureService.getGroomings();
  }

  Future getTrainers() {
    return _petFeatureService.getTrainers();
  }

  Future getPharmacies() {
    return _petFeatureService.getPharmacies();
  }

  Future getMarkets() {
    return _petFeatureService.getMarkets();
  }

  Future addReview(Review review, String serviceName, String serviceID) {
    return _petFeatureService.addReview(review, serviceName, serviceID);
  }
}
