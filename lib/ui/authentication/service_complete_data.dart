import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/models/petServicesModel.dart';
import 'package:pet_care/ui/authentication/authentication-provider.dart';
import 'package:pet_care/widgets/animation_utils.dart';
import 'package:pet_care/widgets/bottom_navigation_bar.dart';
import 'package:pet_care/widgets/gallary_or_camera_dialog.dart';
import 'package:provider/provider.dart';

class PetServiceCompleteData extends StatefulWidget {
  final PetServices petService;
  final String userType;
  final String password;

  const PetServiceCompleteData(
      {Key key, this.petService, this.userType, this.password})
      : super(key: key);
  @override
  _PetServiceCompleteDataState createState() => _PetServiceCompleteDataState();
}

class _PetServiceCompleteDataState extends State<PetServiceCompleteData> {
  List<Service> petServices = [];
  File petServiceImage;
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController serviceName = TextEditingController();
  TextEditingController productPrice = TextEditingController();

  StorageTaskSnapshot storageSnapshot;
  String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: Consumer<AuthenticationProvider>(
          builder: (context, signUpProv, child) => Container(
            color: Colors.black12,
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                  child: Column(
                    children: [
                      Text(
                        "Complete your data",
                        style: TextStyle(
                            fontFamily: 'Co',
                            color: Color(0xCCc25e3c),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: address,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black, fontFamily: 'Co'),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: 'Co'),
                            //  hintText: 'Enter tour current Address',
                            labelText: 'Address',
                            labelStyle: TextStyle(
                                color: Colors.black26, fontFamily: 'Co'),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFc25e3c))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFc25e3c)))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.black, fontFamily: 'Co'),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: 'Co'),
                            //  hintText: 'Enter tour current Address',
                            labelText: 'Phone',
                            labelStyle: TextStyle(
                                color: Colors.black26, fontFamily: 'Co'),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFc25e3c))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFc25e3c)))),
                      ),
                      widget.userType == 'market'
                          ? Container()
                          : widget.userType == 'pharmacy'
                              ? Container()
                              : SizedBox(
                                  height: 10,
                                ),
                      widget.userType == 'market'
                          ? Container()
                          : widget.userType == 'pharmacy'
                              ? Container()
                              : TextField(
                                  controller: price,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      color: Colors.black, fontFamily: 'Co'),
                                  decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 15, 0, 0),
                                        child: FaIcon(
                                          FontAwesomeIcons.dollarSign,
                                          size: 18,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontFamily: 'Co'),
                                      //  hintText: 'Price of appointment',
                                      labelText: 'Price',
                                      labelStyle: TextStyle(
                                          color: Colors.black26,
                                          fontFamily: 'Co'),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFc25e3c))),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFc25e3c)))),
                                ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: experience,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'Co'),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: 'Co'),
                            // hintText: 'years of experience',
                            labelText: 'Experience',
                            labelStyle: TextStyle(
                                color: Colors.black26, fontFamily: 'Co'),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFc25e3c))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFc25e3c)))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 65,
                                  backgroundColor: Colors.white,
                                  backgroundImage: petServiceImage != null
                                      ? FileImage(
                                          petServiceImage,
                                        )
                                      : AssetImage(
                                          widget.userType == 'grooming'
                                              ? 'assets/images/service.png'
                                              : 'assets/images/pet.jpg',
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
                                            onSelectImage: (photo) async {
                                              setState(() {
                                                petServiceImage = photo;
                                              });
                                              StorageReference
                                                  storageReference =
                                                  FirebaseStorage().ref().child(
                                                      petServiceImage
                                                          .toString());
                                              StorageUploadTask uploadTask =
                                                  storageReference
                                                      .putFile(petServiceImage);
                                              storageSnapshot =
                                                  await uploadTask.onComplete;
                                              img = await storageSnapshot.ref
                                                  .getDownloadURL();
                                              print(img);
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
                            height: 5,
                          ),
                          Container(
                            width: 200,
                            child: TextField(
                              controller: serviceName,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'Co'),
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontFamily: 'Co'),
                                  labelText: widget.userType == 'pharmacy'
                                      ? 'Product name'
                                      : widget.userType == 'market'
                                          ? 'Product name'
                                          : 'Service Name',
                                  labelStyle: TextStyle(
                                      color: Colors.black26, fontFamily: 'Co'),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFc25e3c))),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFc25e3c)))),
                            ),
                          ),
                          widget.userType == 'market'
                              ? SizedBox(
                                  height: 10,
                                )
                              : widget.userType == 'pharmacy'
                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : Container(),
                          widget.userType == 'market'
                              ? Container(
                                  width: 200,
                                  child: TextField(
                                    controller: productPrice,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontFamily: 'Co'),
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                            fontFamily: 'Co'),
                                        labelText: 'Product Price',
                                        labelStyle: TextStyle(
                                            color: Colors.black26,
                                            fontFamily: 'Co'),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFc25e3c))),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFc25e3c)))),
                                  ),
                                )
                              : widget.userType == 'pharmacy'
                                  ? Container(
                                      width: 200,
                                      child: TextField(
                                        controller: productPrice,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Co'),
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black54,
                                                fontFamily: 'Co'),
                                            labelText: 'Product Price',
                                            labelStyle: TextStyle(
                                                color: Colors.black26,
                                                fontFamily: 'Co'),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFc25e3c))),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFc25e3c)))),
                                      ),
                                    )
                                  : Container()
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: RaisedButton(
                          color: Color(0xFFc25e3c),
                          onPressed: () {
                            setState(() {
                              print('======$img');
                              Service services = Service();
                              services.serviceName = serviceName.text;
                              services.servicePic = img;
                              productPrice == null
                                  ? services.price =
                                      int.parse(productPrice.text)
                                  : services.price = 0;

                              petServices = [...petServices, services];
                              serviceName.clear();
                              productPrice.clear();
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Add',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Co'),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: petServices.length == 0 ? 0 : 190,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: petServices.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  petServices[index]
                                                      .servicePic))),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          petServices[index].serviceName,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: AppTheme.headLine1Color,
                                            fontFamily: 'Co',
                                          ),
                                        ),
                                        widget.userType == 'pharmacy'
                                            ? SizedBox(
                                                width: 20,
                                              )
                                            : widget.userType == 'market'
                                                ? SizedBox(
                                                    width: 20,
                                                  )
                                                : Container(),
                                        widget.userType == 'pharmacy'
                                            ? Text(
                                                '\$${petServices[index].price.toString()}',
                                                maxLines: 2,
                                                style: TextStyle(
                                                  color:
                                                      AppTheme.headLine1Color,
                                                  fontFamily: 'Co',
                                                ),
                                              )
                                            : widget.userType == 'market'
                                                ? Text(
                                                    '\$${petServices[index].price.toString()}',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      color: AppTheme
                                                          .headLine1Color,
                                                      fontFamily: 'Co',
                                                    ),
                                                  )
                                                : Container(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: RaisedButton(
                            color: Color(0xddffffff),
                            onPressed: () async {
                              print(price.text);
                              PetServices petService = PetServices();
                              price.text == ''
                                  ? petService = PetServices(
                                      name: widget.petService.name,
                                      email: widget.petService.email,
                                      phone: phone.text,
                                      address: address.text,
                                      yearsOfExp: int.parse(experience.text),
                                      services: petServices,
                                      serviceName: widget.userType)
                                  : petService = PetServices(
                                      name: widget.petService.name,
                                      email: widget.petService.email,
                                      phone: phone.text,
                                      address: address.text,
                                      price: int.parse(price.text),
                                      yearsOfExp: int.parse(experience.text),
                                      services: petServices,
                                      serviceName: widget.userType);
                              await signUpProv.signUp(widget.petService.email,
                                  widget.password, petService);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => BottomNav(
                                    user: signUpProv.user,
                                  ),
                                ),
                                (route) => false,
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Color(0xFFc25e3c),
                                      fontSize: 16,
                                      fontFamily: 'Co'),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
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
}
