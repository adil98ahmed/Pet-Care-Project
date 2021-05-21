import 'package:firebase_database/firebase_database.dart';
import 'package:pet_care/models/doctor_model.dart' hide Review;
import 'package:pet_care/models/petServicesModel.dart';

class PetFeatureService {
  Future<List<Doctor>> getDoctors() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child("doctors");
    var featuresSnapshot = await databaseReference.once();

    Map<dynamic, dynamic> map = featuresSnapshot.value;
    print(map);

    List<Doctor> doctors = [];
    map.entries.forEach((e) {
      Doctor doctor = Doctor.fromJson(e.value);
      doctor.id = e.key;
      doctors.add(doctor);
    });

    return doctors;
  }

  Future<List<PetServices>> getGroomings() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child("groomings");
    var featuresSnapshot = await databaseReference.once();

    Map<dynamic, dynamic> map = featuresSnapshot.value;
    print(map);

    List<PetServices> groomings = [];
    map.entries.forEach((e) {
      PetServices grooming = PetServices.fromJson(e.value);
      grooming.id = e.key;
      groomings.add(grooming);
    });

    return groomings;
  }

  Future<List<PetServices>> getTrainers() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child("trainers");
    var featuresSnapshot = await databaseReference.once();

    Map<dynamic, dynamic> map = featuresSnapshot.value;
    print(map);

    List<PetServices> trainers = [];
    map.entries.forEach((e) {
      PetServices trainer = PetServices.fromJson(e.value);
      trainer.id = e.key;
      trainers.add(trainer);
    });

    return trainers;
  }

  Future<List<PetServices>> getPharmacies() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child("pharmacies");
    var featuresSnapshot = await databaseReference.once();

    Map<dynamic, dynamic> map = featuresSnapshot.value;
    print(map);

    List<PetServices> pharmacies = [];
    map.entries.forEach((e) {
      PetServices pharmacy = PetServices.fromJson(e.value);
      pharmacy.id = e.key;
      pharmacies.add(pharmacy);
    });

    return pharmacies;
  }

  Future<List<PetServices>> getMarkets() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child("markets");
    var featuresSnapshot = await databaseReference.once();

    Map<dynamic, dynamic> map = featuresSnapshot.value;
    print(map);

    List<PetServices> markets = [];
    map.entries.forEach((e) {
      PetServices market = PetServices.fromJson(e.value);
      market.id = e.key;
      markets.add(market);
    });

    return markets;
  }

  Future<Review> addReview(
      Review review, String serviceName, String serviceID) async {
    String node;
    if (serviceName == "grooming") {
      node = "groomings";
    } else if (serviceName == "pharmacy") {
      node = "pharmacies";
    } else if (serviceName == "market") {
      node = "markets";
    } else if (serviceName == "training") {
      node = "trainers";
    }
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .reference()
        .child('$node/$serviceID/reviews')
        .push();
    databaseReference.set(review.toJson());
    var reviewSnapshot = await databaseReference.once();
    Map<dynamic, dynamic> map = reviewSnapshot.value;
    print(map);
    Review reviews = Review.fromJson(map);
    reviews.id = reviewSnapshot.key;
    return reviews;
  }
}
