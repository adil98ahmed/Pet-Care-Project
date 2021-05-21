// import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/ui/slpash_screen/splash_view.dart';

// void main() {
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => MyApp(),
//     ),
//   );
//   SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(statusBarColor: Colors.transparent));
// }
void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care',
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppTheme.appPrimary,
          accentColor: AppTheme.appDark,
          buttonColor: AppTheme.appDark,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: AppTheme.appDark,

              onPrimary: Colors.grey.shade300,
              // onSurface: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          // textButtonTheme: TextButtonThemeData(
          //     // style: TextButton.styleFrom(
          //     //   backgroundColor: Colors.grey.shade200,
          //     //   textStyle: TextStyle(
          //     //     color: AppTheme.headLine1Color,
          //     //   ),
          //     // ),
          //     ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.white,
          ),
          tabBarTheme: TabBarTheme(
            labelStyle: TextStyle(
              fontSize: 20,
            ),
            // unselectedLabelStyle: TextStyle(
            //   fontSize: 20,
            // ),
          ),
          fixTextFieldOutlineLabel: true,
          // inputDecorationTheme: InputDecorationTheme(
          //   border: InputBorder.none,
          // ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppTheme.bgMain,
            selectedItemColor: AppTheme.appDark,
            unselectedItemColor: AppTheme.kUnselectedItemColor,
            unselectedIconTheme: IconThemeData(size: 30),
            selectedIconTheme: IconThemeData(size: 40),
            selectedLabelStyle: TextStyle(
              fontSize: 12,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
            ),
          ),
          // textTheme: TextTheme(
          //   headline1: TextStyle(
          //     fontSize: 27,
          //     color: AppTheme.headLine1Color,
          //     fontFamily: 'Co',
          //   ),
          //   headline2: Theme.of(context).textTheme.headline1.copyWith(
          //         fontSize: 23,
          //         color: AppTheme.headLine1Color,
          //       ),
          //   headline3: Theme.of(context).textTheme.headline1.copyWith(
          //         fontSize: 17,
          //         color: AppTheme.headLine1Color,
          //       ),
          //   subtitle1: Theme.of(context).textTheme.headline1.copyWith(
          //         fontSize: 17,
          //         fontWeight: FontWeight.w600,
          //         color: AppTheme.appDark,
          //       ),
          //   subtitle2: Theme.of(context).textTheme.headline1.copyWith(
          //         fontSize: 14,
          //         fontWeight: FontWeight.w600,
          //         color: AppTheme.headLine1Color,
          //       ),
          //   bodyText1: TextStyle(
          //     fontSize: 18,
          //     color: AppTheme.headLine1Color,
          //     fontFamily: 'Co',
          //   ),
          //   bodyText2: TextStyle(
          //     fontSize: 18,
          //     color: Colors.grey.shade300,
          //     fontFamily: 'Co',
          //   ),
          //   headline4: TextStyle(
          //     fontSize: 12,
          //     color: Colors.grey.shade400,
          //     fontWeight: FontWeight.w500,
          //     fontFamily: 'Co',
          //   ),
          //   caption: TextStyle(
          //     fontSize: 13,
          //     fontWeight: FontWeight.w500,
          //     color: AppTheme.headLine1Color,
          //   ),
          //   button: TextStyle(
          //     fontSize: 20,
          //     color: Colors.white,
          //   ),
          // ),
          iconTheme: IconThemeData(
            color: AppTheme.appDark,
          )),
      home: SplashScreen(),
    );
  }
}
