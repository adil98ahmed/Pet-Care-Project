import 'dart:io';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/services/auth-service.dart';

class AuthRepository {
  AuthService _authService = AuthService();
  Future signInEmailAndPassword(
      String email, String password, String userType) {
    return _authService.signInEmailAndPassword(email, password, userType);
  }

  Future signInWithGoogle() {
    return _authService.signInWithGoogle();
  }

  Future signUp(String email, String password, var user) {
    return _authService.signUp(email, password, user);
  }

  // Future signUpAsDoctor(String email, String password, Doctor user) {
  //   return _authService.signUpAsDoctor(email, password, user);
  // }

  Future updateUser(UserModel user, File img) {
    return _authService.updateUser(user, img);
  }
}
