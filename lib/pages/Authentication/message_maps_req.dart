import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rideshare_/main.dart';
import 'package:rideshare_/pages/Authentication/welcome_screen.dart';
import 'package:rideshare_/text_button.dart';

void showMyDialog(BuildContext context) {
  Future<void> getPermission(bool set) async {
    if (set) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    } else {
      permission = permission = LocationPermission.denied;
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset('Assets/Location.svg'),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Enable your location',
              style: TextStyle(
                color: Color(0xFF414141),
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Choose your location to start find the request around you',
              style: TextStyle(color: Color(0xFFA0A0A0), fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 320,
              height: 54,
              child: Button(
                text: 'Use my location',
                onPressed: () {
                  getPermission(true);
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              height: 54,
              child: WhiteButton(
                text: 'Skip for now',
                onPressed: () {
                  getPermission(false);
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
