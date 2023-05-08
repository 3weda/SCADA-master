import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather/firebase_options.dart';
import 'package:weather/pages/RegisterPage.dart';
import 'package:weather/pages/control.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/pages/mail_screen.dart';
import 'package:weather/pages/pressure_screen.dart';
import 'package:weather/pages/qrcode.dart';
import 'package:weather/pages/report_screen.dart';
import 'package:weather/pages/sensor_screen.dart';
import 'package:weather/pages/settings_screen.dart';
import 'package:weather/pages/splash_screen.dart';
import 'package:weather/pages/support_screen.dart';
import 'package:weather/pages/tempreture_screen.dart';
import 'pages/barChart_screen.dart';
import 'pages/notification_screen.dart';
import 'pages/table_screen.dart';
import 'pages/humidity_screen.dart';
import 'pages/infrared_screen.dart';
import 'pages/profil.dart';
import 'pages/LoginPage.dart';
import 'pages/IntroductionScreen.dart';
import 'pages/nav_but.dart';
import 'pages/note_screen.dart';

import 'package:weather/pages/About_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCADA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AppView(),
      routes: {
        SCADAIntroduction.routeName: (c) => SCADAIntroduction(),
        SplashPage.routeName: (c) => SplashPage(),
        LoginPage.routeName: (c) => LoginPage(),
        NavHome.routeName: (c) => NavHome(),
        Tables.routeName: (c) => Tables(),
        HomePage.routeName: (c) => HomePage(),
        Profil.routeName: (c) => Profil(),
        Tempreture.routeName: (c) => Tempreture(),
        Humidity.routeName: (c) => Humidity(),
        Pressure.routeName: (c) => Pressure(),
        Infrared.routeName: (c) => Infrared(),
        BarChart.routeName: (c) => BarChart(),
        Sensor.routeName: (c) => Sensor(),
        Mail.routeName: (c) => Mail(),
        Notifications.routeName: (c) => Notifications(),
        Note.routeName: (c) => Note(),
        Support.routeName: (c) => Support(),
        Report.routeName: (c) => Report(),
        About.routeName: (c) => About(),
        QRcode.routeName: (c) => QRcode(),
        Setting.routeName: (c) => Setting(),
        RegisterPage.routeName: (c) => RegisterPage(),
        Control.routeName: (c) => Control(),
      },
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return const SplashPage();
          default:
            return const SplashPage();
        }
      },
    );
  }
}
