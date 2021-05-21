import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pet_care/models/pet_model.dart';

class PetService {
  Future<Pet> addPet(Pet pets, File img) async {
    String id = FirebaseAuth.instance.currentUser.uid;
    if (img == null) {
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.reference().child("users/$id/pets").push();
      databaseReference.set(pets.toJson());
      var petSnapshot = await databaseReference.once();
      Map<dynamic, dynamic> map = petSnapshot.value;
      Pet pet = Pet.fromJson(map);
      pet.id = petSnapshot.key;
      return pet;
    } else {
      print(img.path);
      StorageReference storageReference =
          FirebaseStorage().ref().child(img.toString());
      StorageUploadTask uploadTask = storageReference.putFile(img);
      StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;
      pets.img = await storageSnapshot.ref.getDownloadURL();
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.reference().child("users/$id/pets").push();
      databaseReference.set(pets.toJson());
      var petSnapshot = await databaseReference.once();
      Map<dynamic, dynamic> map = petSnapshot.value;
      Pet pet = Pet.fromJson(map);
      pet.id = petSnapshot.key;
      return pet;
    }
  }

  Future<Pet> editPet(Pet pet, File img) async {
    String id = FirebaseAuth.instance.currentUser.uid;
    if (img == null) {
      print(pet.id);
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .reference()
          .child("users/$id/pets/${pet.id}");
      databaseReference.update(pet.toJson());
      var petSnapshot = await databaseReference.once();
      Map<dynamic, dynamic> map = petSnapshot.value;
      Pet pets = Pet.fromJson(map);
      pets.id = petSnapshot.key;
      return pets;
    } else {
      print(img.path);
      print(pet.id);
      StorageReference storageReference =
          FirebaseStorage().ref().child(img.toString());
      StorageUploadTask uploadTask = storageReference.putFile(img);
      StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;
      pet.img = await storageSnapshot.ref.getDownloadURL();
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .reference()
          .child("users/$id/pets/${pet.id}");
      databaseReference.update(pet.toJson());
      var petSnapshot = await databaseReference.once();
      Map<dynamic, dynamic> map = petSnapshot.value;
      Pet pets = Pet.fromJson(map);
      pets.id = petSnapshot.key;
      return pets;
    }
  }

  Future<List<Pet>> getUserPets() async {
    String id = FirebaseAuth.instance.currentUser.uid;
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child("users/$id/pets");
    var petSnapshot = await databaseReference.once();
    Map<dynamic, dynamic> map = petSnapshot.value;
    print(map);
    List<Pet> pets = [];
    map.entries.forEach((e) {
      Pet pet = Pet.fromJson(e.value);
      pet.id = e.key;
      pets.add(pet);
    });
    return pets;
  }
}
