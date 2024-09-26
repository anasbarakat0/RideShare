import 'package:flutter/material.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/pages/Drawer/Settings/change_password.dart';
import 'package:rideshare_/pages/Drawer/Settings/privacy_policy.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text('Back'),
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 95),
            ],
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage(),
                ),
              );
            },
            child: Container(
              width: 362,
              height: 51,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.greenIcon,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Change Password"),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicy(),
                ),
              );
            },
            child: Container(
              width: 362,
              height: 51,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.greenIcon,
                  )),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Privacy Policy"),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
