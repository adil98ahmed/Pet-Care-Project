import 'package:flutter/widgets.dart';
import 'package:pet_care/models/doctor_model.dart';
import 'package:pet_care/repositories/dctor-booking-repo.dart';
import 'package:pet_care/ui/authentication/authentication-provider.dart';

class DoctorBookingProvider extends ChangeNotifier {
  var user;
  AuthenticationProvider auth = AuthenticationProvider();
  DortorBookingRepo _bookingRepo = DortorBookingRepo();
  updateUser(Doctor user) async {
    user = await _bookingRepo.updateUser(user);
    notifyListeners();
  }

  String getCurrentUserId() {
    return _bookingRepo.getCurrentUserId();
  }
}
