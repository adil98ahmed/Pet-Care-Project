import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/models/doctor_model.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/ui/authentication/auth_ways.dart';
import 'package:pet_care/ui/authentication/authentication-provider.dart';
import 'package:pet_care/ui/profile/add_pet_details.dart';
import 'package:pet_care/ui/profile/edit_profile_view.dart';
import 'package:pet_care/ui/profile/my_pet_view.dart';
import 'package:pet_care/widgets/appBar.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  final user;

  const ProfileView({Key key, this.user}) : super(key: key);
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var imgPath;
    var name;
    if (widget.user.runtimeType == Doctor) {
      imgPath = widget.user.profilePic;
      name = widget.user.firstName;
    } else if (widget.user.runtimeType == UserModel) {
      imgPath = widget.user.img;
      name = widget.user.name;
    } else {
      imgPath = widget.user.picture;
      name = widget.user.name;
    }
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          evaluation: 0,
          title: "Profile",
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          EditProfileView(user: widget.user),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: AppTheme.appDark,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: AppTheme.appDark,
                        fontFamily: 'Co',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: Consumer<AuthenticationProvider>(
          builder: (context, profileProv, _) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey[400],
                            blurRadius: 10,
                            offset: Offset(0.0, 0.75)),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(imgPath),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          (name),
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Co',
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.user.email,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Co',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyPetView(
                                        user: widget.user,
                                      )));
                        },
                        child: buildColumn(
                          'My Pets',
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/paw.png',
                              color: AppTheme.appDark,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AddPetDetails(
                                        user: widget.user,
                                      )));
                        },
                        child: buildColumn(
                          'Add Pet Details',
                          Icon(
                            Icons.description_rounded,
                            color: AppTheme.appDark,
                            size: 20,
                          ),
                        ),
                      ),
                      buildColumn(
                          'Help',
                          Icon(
                            Icons.help_outline_rounded,
                            color: AppTheme.appDark,
                            size: 20,
                          )),
                      InkWell(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AuthenticationScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: buildColumn(
                            'Log Out',
                            Icon(
                              Icons.exit_to_app_rounded,
                              color: AppTheme.appDark,
                              size: 20,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildColumn(String title, Widget icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: AppTheme.appColor,
                  child: icon,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Co',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            )
          ],
        ),
        Divider(
          color: Colors.grey[300],
          height: 40,
        )
      ],
    );
  }
}
