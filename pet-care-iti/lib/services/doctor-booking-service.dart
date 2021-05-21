import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pet_care/models/doctor_model.dart';

class DoctorAndBookingService {
  Future<Doctor> updateDoctor(Doctor user) async {
    String id;
    id = FirebaseAuth.instance.currentUser.uid;
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child("doctors").child(id);
    print(user.toJson());
    await databaseReference.update(user.toJson());
    var userSnapshot = await databaseReference.once();
    Doctor updatedUser = Doctor.fromJson(userSnapshot.value);
    return updatedUser;
  }

  String getCurrentUser() {
    String id;
    id = FirebaseAuth.instance.currentUser.uid;
    return id;
  }
}
