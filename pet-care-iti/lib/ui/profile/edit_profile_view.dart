import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/ui/authentication/authentication-provider.dart';
import 'package:pet_care/widgets/animation_utils.dart';
import 'package:pet_care/widgets/appBar.dart';
import 'package:pet_care/widgets/auth_input_widget.dart';
import 'package:pet_care/widgets/gallary_or_camera_dialog.dart';
import 'package:provider/provider.dart';

class EditProfileView extends StatefulWidget {
  final UserModel user;

  const EditProfileView({Key key, this.user}) : super(key: key);
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController fullName, email, phone, bio;
  String gender;
  var images = [
    'assets/images/male.png',
    'assets/images/female.png',
  ];
  var genderList = ['Male', 'Female'];
  File userImage;

  int _value;
  @override
  void initState() {
    fullName = TextEditingController(text: widget.user.name);
    email = TextEditingController(text: widget.user.email);
    phone = TextEditingController(text: widget.user.phone);
    bio = TextEditingController(text: widget.user.bio);
    super.initState();
    if (widget.user.gender == 'Male')
      _value = 0;
    else
      _value = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.grey,
            ),
          ),
          evaluation: 0.5,
          title: "Your Profile",
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: Consumer<AuthenticationProvider>(
          builder: (context, editProfileProv, _) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.white,
                          backgroundImage: userImage != null
                              ? FileImage(
                                  userImage,
                                )
                              : NetworkImage(
                                  widget.user.img,
                                ),
                        ),
                        Positioned(
                          bottom: 1,
                          left: 2,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                HeroDialogRoute(
                                  builder: (BuildContext context) =>
                                      CameraOrGallaryDialog(
                                    onSelectImage: (photo) {
                                      setState(() {
                                        userImage = photo;
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 57,
                              width: 126,
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(70),
                                      bottomLeft: Radius.circular(70))),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 35,
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  AuthInput(
                    controller: fullName,
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    label: 'Full Name',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Owner',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Co',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: Wrap(
                      spacing: 40,
                      children: List<Widget>.generate(
                        genderList.length,
                        (int index) {
                          return ChoiceChip(
                            label: Container(
                              width: 118,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    images[index],
                                    height: 16,
                                    color: _value == index
                                        ? Colors.white
                                        : AppTheme.appDark,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    genderList[index],
                                    style: TextStyle(
                                      color: _value == index
                                          ? Colors.white
                                          : Colors.black87,
                                      fontFamily: 'Co',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            selected: _value == index,
                            selectedColor: AppTheme.appDark,
                            onSelected: (bool value) {
                              setState(() {
                                _value = value ? index : null;
                                gender = genderList[index];
                                print(gender);
                              });
                            },
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                    width: 1,
                                    color: _value == index
                                        ? AppTheme.appDark
                                        : Colors.grey[350])),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AuthInput(
                    controller: email,
                    suffixIcon: Icon(
                      Icons.email_rounded,
                      color: Colors.grey,
                    ),
                    label: 'Email',
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AuthInput(
                    controller: phone,
                    suffixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    label: 'Phone',
                    inputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AuthInput(
                    controller: bio,
                    label: 'About Me',
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () async {
                      UserModel user = UserModel(
                          email: email.text,
                          name: fullName.text,
                          phone: phone.text,
                          bio: bio.text,
                          gender: gender,
                          pets: widget.user.pets);
                      await editProfileProv.updateUser(user, userImage);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppTheme.appDark,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Co',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
