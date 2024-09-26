import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rideshare_/pages/onboarding/map.dart';
import 'package:rideshare_/service/shared_prefrences/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool go = false;
  double _progress = 0.3;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 86,
            width: 86,
            child: CircularProgressIndicator(
              value: _progress,
              valueColor: const AlwaysStoppedAnimation(Color(0xFF08B783)),
              color: const Color(0xFF08B783),
              backgroundColor: const Color(0xFFB9E5D1),
            ),
          ),
          FloatingActionButton(
              onPressed: () {
                if (go) {
                  storage.get<SharedPreferences>().setBool("firstTime", false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MapPage()));
                  // context.go('/MapPage');
                } else {
                  _progress += 0.35;
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                  setState(() {
                    if (controller.page! == 1) {
                      go = true;
                    }
                  });
                }
              },
              shape: const CircleBorder(),
              child: go
                  ? const Text(
                      'Go',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF5A5A5A),
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF5A5A5A),
                    )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 93,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset('assets/Anywhere you are.svg'),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  const Text(
                    'Anywhere you are',
                    style: TextStyle(
                      color: Color(0xFF414141),
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    width: 280,
                    child: Text(
                      "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                      style: TextStyle(
                        color: Color(0xFFA0A0A0),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 93,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset('assets/At anytime.svg'),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  const Text(
                    'At anytime',
                    style: TextStyle(
                      color: Color(0xFF414141),
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    width: 280,
                    child: Text(
                      "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                      style: TextStyle(
                        color: Color(0xFFA0A0A0),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 93,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset('assets/Frame 1.svg'),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  const Text(
                    'Book your car',
                    style: TextStyle(
                      color: Color(0xFF414141),
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    width: 280,
                    child: Text(
                      "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                      style: TextStyle(
                        color: Color(0xFFA0A0A0),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(2);
                setState(() {
                  go = true;
                  _progress = 1;
                });
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF414141),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: const SizedBox(
        height: 100,
      ),
    );
  }
}
