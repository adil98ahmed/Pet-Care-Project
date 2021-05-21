import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/screens/markets_screen.dart';
import 'package:pet_care/widgets/rounded_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserModel user = UserModel();
    var deviceData = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            Container(
              height: deviceData.size.height * 0.05,
              child: TextField(
                style: TextStyle(
                  color: AppTheme.headLine1Color,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    size: 40.0,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            Container(
              height: deviceData.size.height * 0.2,
              child: Container(
                width: deviceData.size.width * 0.8,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text.rich(
                    TextSpan(
                        text: 'What are you \nlooking for, ',
                        style: Theme.of(context).textTheme.headline1,
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 100),
                              child: Text(
                                user.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(color: Colors.deepOrange),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: RoundedService(
                        size: 110,
                        padding: 20,
                        img: 'assets/images/main_imgs/grooming.png',
                        serviceName: 'Grooming',
                        onTap: null,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 75,
                      child: RoundedService(
                        size: 110,
                        padding: 20,
                        img: 'assets/images/main_imgs/dog walking.png',
                        serviceName: 'Dog walking',
                        onTap: null,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 75,
                      child: RoundedService(
                        size: 110,
                        padding: 20,
                        img: 'assets/images/main_imgs/taxi.png',
                        serviceName: 'Pet taxi',
                        onTap: null,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RoundedService(
                        size: 140,
                        padding: 20,
                        imgScale: 0.5,
                        img: 'assets/images/main_imgs/vet.png',
                        serviceName: 'Veterinary',
                        onTap: null,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 75,
                      child: RoundedService(
                        size: 110,
                        padding: 20,
                        img: 'assets/images/main_imgs/grooming.png',
                        serviceName: 'Pet date',
                        onTap: null,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 75,
                      child: RoundedService(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => Markets(),
                          ),
                        ),
                        size: 110,
                        padding: 20,
                        img: 'assets/images/main_imgs/adoption.png',
                        serviceName: 'Markets',
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RoundedService(
                        size: 110,
                        padding: 20,
                        img: 'assets/images/main_imgs/training.png',
                        serviceName: 'Training',
                        onTap: null,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
