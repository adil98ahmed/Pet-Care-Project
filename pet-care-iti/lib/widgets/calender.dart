import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/models/doctor_model.dart';
import 'package:pet_care/ui/authentication/doctor-booking-provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class CalenderWidget extends StatefulWidget {
  Doctor d = Doctor();
  CalenderWidget(this.d);

  @override
  _CalenderWidgetState createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  CalendarController _calendarController;
  DateTime headerDate;
  Map<DateTime, List<dynamic>> _events = {};
  Doctor doctor = Doctor();
  Map<String, List<dynamic>> allBooked = {};
  Map<String, List<dynamic>> allGenerated = {};
  List<dynamic> available = [];
  String currentDaySelected = "";
  bool choos = false;
  Map<int, dynamic> daysOfWeek = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday",
  };
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    headerDate = DateTime.now();
    doctor = widget.d;
    generateTimes();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void generateTimes() {
    for (var i = 0; i < doctor.daysOfWork.length; i++) {
      var item = doctor.daysOfWork[i];
      List<String> itemGenerated = [];
      if (item.from > item.to) {
        var temp = item.to;
        item.to = item.from;
        item.from = temp;
      }
      for (var i = item.from; i < item.to; i++) {
        for (var j = 0; j <= 6; j++) {
          var str;
          if (j == 0) {
            str = i.toString() + ":" + "00";
          } else {
            if (j * 10 == 60) {
              str = (i + 1).toString() + ":" + "00";
            } else {
              str = i.toString() + ":" + (j * 10).toString();
            }
          }
          if (j == 6) {
            continue;
          }

          itemGenerated = [...itemGenerated, str];
        }
      }
      allGenerated.addAll({item.day: itemGenerated});
    }
    for (var i = 0; i < doctor.daysOfWork.length; i++) {
      allBooked
          .addAll({doctor.daysOfWork[i].day: doctor.daysOfWork[i].bookedTimes});
    }

    allGenerated.keys.forEach((element) {
      for (var i = 0; i < allGenerated[element].length; i++) {
        if (allBooked[element] != null) {
          for (var j = 0; j < allBooked[element].length; j++) {
            if (allGenerated[element][i] == allBooked[element][j]) {
              String time = allGenerated[element][i];
              allGenerated[element].remove(time);
            }
          }
        }
      }
    });
    print(allGenerated);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DoctorBookingProvider>(
      create: (context) => DoctorBookingProvider(),
      child: Consumer<DoctorBookingProvider>(
        builder: (context, docBokProv, child) => Column(
          children: [
            TableCalendar(
              onDaySelected: (day, events, holidays) {
                setState(() {
                  currentDaySelected = daysOfWeek[day.weekday];
                });
                List<String> keysOfAllGenerated = [];
                allGenerated.keys.forEach((element) {
                  keysOfAllGenerated = [...keysOfAllGenerated, element];
                });
                for (var i = 0; i < keysOfAllGenerated.length; i++) {
                  if (daysOfWeek[day.weekday] == keysOfAllGenerated[i]) {
                    print("success");
                    setState(() {
                      setState(() {
                        available = [];
                      });
                      available = [
                        ...available,
                        ...allGenerated[keysOfAllGenerated[i]]
                      ];
                    });
                    break;
                  } else {
                    setState(() {
                      available = [];
                    });
                  }
                }
              },
              events: _events,
              calendarController: _calendarController,
              builders: CalendarBuilders(
                dayBuilder: (context, date, events) {
                  generateTimes();

                  for (var i = 0; i < doctor.daysOfWork.length; i++) {
                    if (daysOfWeek[date.weekday] == doctor.daysOfWork[i].day) {
                      _events.addAll({
                        date: [""]
                      });
                    }
                  }

                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38),
                    ),
                  );
                },
                dowWeekdayBuilder: (context, weekday) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.black54))),
                  child: Text(
                    weekday,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
                todayDayBuilder: (context, date, events) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFc25e3c),
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: (Text(
                        date.day.toString(),
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  );
                },
              ),
              headerVisible: true,
              onVisibleDaysChanged: (_, __, ___) {
                setState(() {
                  headerDate = _calendarController.focusedDay;
                });
              },
              weekendDays: [],
              calendarStyle: CalendarStyle(
                selectedColor: AppTheme.appDark,
                todayColor: AppTheme.appColor,
              ),
              initialCalendarFormat: CalendarFormat.week,
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                //  rightChevronPadding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                centerHeaderTitle: false,
                leftChevronIcon: Icon(Icons.calendar_today_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: available.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              if (choos == false) {
                                String booked = available[index];
                                List<String> keysOfAllGenerated = [];
                                allGenerated.keys.forEach((element) {
                                  keysOfAllGenerated = [
                                    ...keysOfAllGenerated,
                                    element
                                  ];
                                });
                                for (var i = 0;
                                    i < keysOfAllGenerated.length;
                                    i++) {
                                  var element = keysOfAllGenerated[i];
                                  if (element == currentDaySelected) {
                                    for (var i = 0;
                                        i < doctor.daysOfWork.length;
                                        i++) {
                                      if (currentDaySelected ==
                                          doctor.daysOfWork[i].day) {
                                        doctor.daysOfWork[i].bookedTimes = [
                                          ...doctor.daysOfWork[i].bookedTimes,
                                          available[index]
                                        ];
                                      }
                                    }
                                    for (var i = 0;
                                        i < allGenerated[element].length;
                                        i++) {
                                      if (allGenerated[element][i] ==
                                          available[index]) {
                                        String removed =
                                            allGenerated[element][i];
                                        allGenerated[element].remove(removed);
                                      }
                                    }
                                    PetProfilr petProfilr = PetProfilr(
                                        date: available[index],
                                        desc: "tired and cold",
                                        medicine: ["med1", "med2"],
                                        nextAppointment: available[index]);
                                    var userId = docBokProv.getCurrentUserId();
                                    Patiant p = Patiant(
                                        petOwnerId: userId = userId,
                                        petId: "daadc",
                                        petProfilr: [petProfilr]);
                                    doctor.patiants = [p];
                                    docBokProv.updateUser(doctor);

                                    break;
                                  }
                                }
                                setState(() {
                                  available.remove(booked);
                                });

                                generateTimes();
                                setState(() {
                                  choos = true;
                                });
                              } else {
                                return showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Sorry !'),
                                    content:
                                        Text('Sorry You Can not book again'),
                                    actions: [
                                      RaisedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Ok'),
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Chip(
                              label: Text('${available[index]}'),
                            ),
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
