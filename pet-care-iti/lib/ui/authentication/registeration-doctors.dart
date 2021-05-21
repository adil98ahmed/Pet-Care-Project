import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_care/models/doctor_model.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/ui/authentication/authentication-provider.dart';
import 'package:pet_care/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class RegisteraionDoctor extends StatefulWidget {
  RegisteraionDoctor(this.user, this.password, {this.userType}) : super();
  final UserModel user;
  final String password;
  final String userType;
  @override
  _RegisteraionDoctorState createState() => _RegisteraionDoctorState();
}

String specialist;
String dayOfWork;

class _RegisteraionDoctorState extends State<RegisteraionDoctor> {
  Doctor doctor = new Doctor();
  List<String> daysOfWork = [];
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  String fromText;
  String toText;
  List<DaysOfWork> daysOfWorkModel = [];
  @override
  void initState() {
    super.initState();
    doctor.firstName = widget.user.name;
    doctor.email = widget.user.email;
  }

  @override
  Widget build(BuildContext context) {
    print("-------");
    print(widget.user.name);

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
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton<String>(
                              underline: Container(
                                color: Color(0xFFc25e3c),
                                height: 1,
                              ),
                              hint: Text(
                                'Chosse Spechilaist',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'Co',
                                    fontSize: 14),
                              ),
                              value: specialist,
                              focusColor: Colors.yellow,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              items: <String>[
                                'Veterinarian',
                                'Veterinary Surgeon',
                                'Veterinary Dentist',
                                'Clinic'
                              ].map<DropdownMenuItem<String>>(
                                  (String location) {
                                return DropdownMenuItem<String>(
                                  value: location,
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Co',
                                        fontSize: 14),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                doctor.specialist = newValue;
                                setState(() {
                                  specialist = newValue;
                                });
                              },
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .45,
                              height: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: TextField(
                                  onChanged: (value) {
                                    doctor.yearsOfExp = int.parse(value);
                                  },
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
                                          color: Colors.black26,
                                          fontFamily: 'Co'),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFc25e3c))),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFc25e3c)))),
                                ),
                              ),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            doctor.address = value;
                          },
                          keyboardType: TextInputType.text,
                          style:
                              TextStyle(color: Colors.black, fontFamily: 'Co'),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            doctor.price = int.parse(value);
                          },
                          keyboardType: TextInputType.number,
                          style:
                              TextStyle(color: Colors.black, fontFamily: 'Co'),
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                                  color: Colors.black26, fontFamily: 'Co'),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFc25e3c))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFc25e3c)))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Days of work",
                              style: TextStyle(color: Color(0xFFc25e3c)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton<String>(
                              underline: Container(
                                color: Color(0xFFc25e3c),
                                height: 1,
                              ),
                              hint: Text(
                                'Day',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'Co',
                                    fontSize: 14),
                              ),
                              value: dayOfWork,
                              focusColor: Colors.yellow,
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'Co'),
                              items: <String>[
                                'Saturday',
                                'Sunday',
                                'Monday',
                                'Tuesday',
                                'Wednesday',
                                'Thursday',
                                'Friday'
                              ].map<DropdownMenuItem<String>>(
                                  (String location) {
                                return DropdownMenuItem<String>(
                                  value: location,
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                        color: Colors.black, fontFamily: 'Co'),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dayOfWork = newValue;
                                });
                              },
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * .2,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: from,
                                  onChanged: (value) {
                                    setState(() {
                                      fromText = value;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      color: Colors.black, fontFamily: 'Co'),
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontFamily: 'Co'),
                                      //  hintText: 'hour',
                                      labelText: 'From',
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
                              ),
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * .2,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      toText = value;
                                    });
                                  },
                                  controller: to,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      color: Colors.black, fontFamily: 'Co'),
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontFamily: 'Co'),
                                      // hintText: 'hour',
                                      labelText: 'To',
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
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: RaisedButton(
                          color: Color(0xFFc25e3c),
                          onPressed: () {
                            DaysOfWork dayOfWorkModel = DaysOfWork();
                            dayOfWorkModel.day = dayOfWork;
                            dayOfWorkModel.to = int.parse(toText);
                            dayOfWorkModel.from = int.parse(fromText);
                            daysOfWorkModel = [
                              ...daysOfWorkModel,
                              dayOfWorkModel
                            ];
                            setState(() {
                              from.text = "";
                              to.text = "";
                              dayOfWork = null;
                            });

                            doctor.daysOfWork = [...daysOfWorkModel];
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
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: daysOfWorkModel.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFc25e3c),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    "${daysOfWorkModel[index].day}\nfrom ${daysOfWorkModel[index].from}:00 to ${daysOfWorkModel[index].to}:00"),
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
                              await signUpProv.signUp(
                                  widget.user.email, widget.password, doctor);
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
