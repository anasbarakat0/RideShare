import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rideshare_/core/resources/colors.dart';
import 'package:rideshare_/temp/pages/home_screen.dart';
import 'package:rideshare_/core/resources/shared_prefrences/shared_pref.dart';
import 'package:rideshare_/text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThankYou extends StatefulWidget {
  const ThankYou({super.key});

  @override
  State<ThankYou> createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "Done.svg",
                    width: 124,
                    height: 124,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Thank You",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Your booking has been placed sent to",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  Text(
                    "Mr. ${storage.get<SharedPreferences>().getString("firstName")}",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 56,
                  width: 340,
                  child: Button(
                      text: "Confirm Ride",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                              selectedWidget: 0,
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 34),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
