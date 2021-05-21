import 'dart:io';

import 'package:pet_care/models/pet_model.dart';
import 'package:pet_care/services/pet_service.dart';

class PetRepository {
  PetService _petService = PetService();

  Future addPet(Pet pet, File img) {
    return _petService.addPet(pet, img);
  }

  Future editPet(Pet pet, File img) {
    return _petService.editPet(pet, img);
  }

  Future getUserPets() {
    return _petService.getUserPets();
  }
}
