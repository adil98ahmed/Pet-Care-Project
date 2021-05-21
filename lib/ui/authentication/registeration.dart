import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pet_care/colors/style.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/ui/authentication/authentication-provider.dart';
import 'package:pet_care/ui/authentication/registeration-doctors.dart';
import 'package:pet_care/ui/authentication/service_complete_data.dart';
import 'package:pet_care/ui/authentication/sign_in_screen.dart';
import 'package:pet_care/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:pet_care/models/petServicesModel.dart';

class Registeraion extends StatefulWidget {
  @override
  _RegisteraionState createState() => _RegisteraionState();
}

String userType;

class _RegisteraionState extends State<Registeraion> {
  bool isChecked = false;
  bool signUpClicked = false;
  bool choosedUserType = false;
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool s = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2e2b43),
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: Consumer<AuthenticationProvider>(
          builder: (context, signUpProv, _) => Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                child: Container(
                  color: Color(0xFF2e2b43),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .20,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
                    child: Text(
                      'Registeration',
                      style: TextStyle(
                          color: Colors.white, fontSize: 30, fontFamily: 'Co'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .08,
                left: 15,
                right: 15,
                child: Card(
                  elevation: 8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: username,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Co'),
                            decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    size: 15,
                                    color: Colors.green,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontFamily: 'Co'),
                                //hintText: 'Enter Your Full Name',
                                labelText: 'Full Name',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black26,
                                    fontFamily: 'Co'),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFc25e3c))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFc25e3c)))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Co'),
                            decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    size: 15,
                                    color: Colors.green,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontFamily: 'Co'),
                                // hintText: 'enter your email',
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black26,
                                    fontFamily: 'Co'),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFc25e3c))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFc25e3c)))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: TextField(
                            controller: password,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Co'),
                            obscureText: !showPassword,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  child: Icon(
                                      showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                      size: 20),
                                  onTap: () => setState(() {
                                    showPassword = !showPassword;
                                  }),
                                ),
                                // hintText: 'enter your Password',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontFamily: 'Co'),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black26,
                                    fontFamily: 'Co'),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFc25e3c))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFc25e3c)))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                              child: DropdownButton<String>(
                                underline: Container(
                                  color: Color(0xFFc25e3c),
                                  height: 1,
                                ),
                                hint: Text(
                                  'Choose type of you',
                                  style: TextStyle(
                                      fontFamily: 'Co',
                                      color: (signUpClicked && !choosedUserType)
                                          ? Colors.red
                                          : Colors.black26),
                                ),
                                value: userType,
                                focusColor: Colors.yellow,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                items: <String>[
                                  'user',
                                  'doctor',
                                  'grooming',
                                  'pharmacy',
                                  'market',
                                  'training',
                                ].map<DropdownMenuItem<String>>(
                                    (String location) {
                                  return DropdownMenuItem<String>(
                                    value: location,
                                    child: Text(
                                      location,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Co'),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    choosedUserType = true;
                                    userType = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: RaisedButton(
                            color: Color(0xFFc25e3c),
                            onPressed: () async {
                              setState(() {
                                signUpClicked = true;
                              });
                              if (choosedUserType) {
                                UserModel user = UserModel(
                                  email: email.text,
                                  name: username.text,
                                );

                                if (userType == 'doctor') {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => RegisteraionDoctor(
                                          user, password.text,
                                          userType: userType),
                                    ),
                                  );
                                } else if (userType == 'user') {
                                  var returnedUser;
                                  returnedUser = await signUpProv.signUp(
                                      email.text, password.text, user);
                                  if (returnedUser.runtimeType != null) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            BottomNav(
                                          user: returnedUser,
                                        ),
                                      ),
                                      (route) => false,
                                    );
                                  }
                                } else {
                                  PetServices petService = PetServices(
                                    email: email.text,
                                    name: username.text,
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PetServiceCompleteData(
                                              petService: petService,
                                              password: password.text,
                                              userType: userType),
                                    ),
                                  );
                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  userType == 'user' ? 'Sign Up' : 'Complete',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Co'),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .68,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .25,
                    child: Column(
                      children: [
                        Text(
                          'or continue with',
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Co',
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Color(0xFF4267B2),
                              size: 35,
                            ),
                            SizedBox(width: 50),
                            FaIcon(
                              FontAwesomeIcons.google,
                              color: AppTheme.appDark,
                              size: 35,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have account? ",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Co',
                                  fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: AppTheme.appDark,
                                    fontFamily: 'Co',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
