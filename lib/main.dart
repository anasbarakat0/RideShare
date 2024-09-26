import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rideshare_/features/auth/presentation/view/welcome_screen.dart';
import 'package:rideshare_/temp/pages/home_screen.dart';
import 'package:rideshare_/temp/pages/onboarding/onBoarding_page.dart';
import 'package:rideshare_/core/resources/shared_prefrences/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

LocationPermission? permission;
void main() async {
  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF08B783)),
        primaryColor: const Color(0xFF08B783),
        primarySwatch: const MaterialColor(
          0xFF08B783,
          <int, Color>{
            50: Color(0xFFFFFFFF),
            100: Color(0xFFFFFFFF),
            200: Color(0xFF80E3D0),
            300: Color(0xFF4DD9BD),
            400: Color(0xFF26D1AF),
            500: Color(0xFF08B783),
            600: Color(0xFF06A377),
            700: Color(0xFF058A69),
            800: Color(0xFF04715C),
            900: Color(0xFF03574A),
          },
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xFF08B783),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
        ),
      ),

      // home: Scaffold(
      //   body: OnBoardingPage(),
      // ),
      home: storage.get<SharedPreferences>().getBool("firstTime") ?? true
          ? const OnBoardingPage()
          : storage.get<SharedPreferences>().getBool("auth") ?? false == true
              ? const HomeScreen(
                  selectedWidget: 0,
                )
              : const AuthPage(),
    );
  }
}
