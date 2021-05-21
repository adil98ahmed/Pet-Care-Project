import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:pet_care/models/pet_model.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/repositories/pet_repository.dart';

class PetProvider extends ChangeNotifier {
  UserModel user;
  List<Pet> pets;
  Pet pet;

  PetRepository _petRepository = PetRepository();
  PetProvider() {
    getUserPets();
  }

  addPet(Pet pet, File img) async {
    pet = await _petRepository.addPet(pet, img);
    notifyListeners();
  }

  editPet(Pet pet, File img) async {
    pet = await _petRepository.editPet(pet, img);
    notifyListeners();
  }

  getUserPets() async {
    pets = await _petRepository.getUserPets();
    notifyListeners();
  }
}
