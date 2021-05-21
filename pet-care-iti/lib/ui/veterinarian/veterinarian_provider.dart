import 'package:flutter/widgets.dart';
import 'package:pet_care/models/doctor_model.dart';
import 'package:pet_care/repositories/pet_features_repository.dart';

class VeterinarianProvider extends ChangeNotifier {
  List<Doctor> doctors;

  PetFeaturesRepository _veterinarianRepository = PetFeaturesRepository();
  VeterinarianProvider() {
    getDoctors();
  }

  getDoctors() async {
    doctors = await _veterinarianRepository.getDoctors();
    notifyListeners();
  }
}
