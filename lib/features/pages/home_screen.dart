import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rideshare_/core/resources/colors.dart';
import 'package:rideshare_/temp/pages/Drawer/drawer.dart';
import 'package:rideshare_/features/favourite/presentation/view/favourite.dart';
import 'package:rideshare_/features/hubs/presentation/view/home_screen_transport.dart';
import 'package:rideshare_/features/offer/presentation/view/offer.dart';
import 'package:rideshare_/temp/pages/profile.dart';
import 'package:rideshare_/features/wallet/presentation/view/wallet.dart';

class HomeScreen extends StatefulWidget {
  final int selectedWidget;
  const HomeScreen({super.key, required this.selectedWidget});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;
  late Widget _selectedWidget;

  @override
  void initState() {
    _selectedIndex = widget.selectedWidget;
    if (_selectedIndex == 0) {
      _selectedWidget = const HomeScreenTransport();
    } else if (_selectedIndex == 1) {
      _selectedWidget = const Favourite();
    } else if (_selectedIndex == 2) {
      _selectedWidget = const Offer();
    } else if (_selectedIndex == 3) {
      _selectedWidget = const Profile();
    } else if (_selectedIndex == 4) {
      _selectedWidget = const Wallet();
    }
    super.initState();
  }

  changePage(int pageNum) {
    setState(() {
      _selectedIndex = pageNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            _selectedWidget,
            Positioned(
                bottom: 0,
                child: SvgPicture.asset(
                  'assets/bar.svg',
                  width: MediaQuery.of(context).size.width,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Home Button
                    InkWell(
                      onTap: () => onPressed(0),
                      child: SizedBox(
                        width: 60,
                        child: Column(
                          children: [
                            Icon(
                              _selectedIndex == 0
                                  ? Icons.home
                                  : Icons.home_outlined,
                              color: _selectedIndex == 0
                                  ? AppColors.greenIcon
                                  : AppColors.darkGrey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  color: _selectedIndex == 0
                                      ? AppColors.greenIcon
                                      : AppColors.darkGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Favourite Button
                    InkWell(
                      onTap: () => onPressed(1),
                      child: SizedBox(
                        width: 60,
                        child: Column(
                          children: [
                            Icon(
                              _selectedIndex == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: _selectedIndex == 1
                                  ? AppColors.greenIcon
                                  : AppColors.darkGrey,
                            ),
                            Text(
                              'Favourite',
                              style: TextStyle(
                                  color: _selectedIndex == 1
                                      ? AppColors.greenIcon
                                      : AppColors.darkGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),

                    Column(
                      children: [
                        const SizedBox(
                          width: 60,
                          height: 23,
                        ),
                        Text(
                          'Wallet',
                          style: TextStyle(
                              color: _selectedIndex == 4
                                  ? AppColors.greenIcon
                                  : AppColors.darkGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),

                    // Offer Button
                    InkWell(
                      onTap: () => onPressed(2),
                      child: SizedBox(
                        width: 60,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 23,
                              child: Image(
                                image: _selectedIndex == 2
                                    ? const AssetImage(
                                        "assets/Subtract.png",
                                      )
                                    : const AssetImage(
                                        "assets/Vector-2.png",
                                      ),
                                width: 20,
                              ),
                            ),
                            Text(
                              'Offer',
                              style: TextStyle(
                                  color: _selectedIndex == 2
                                      ? AppColors.greenIcon
                                      : AppColors.darkGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Profile Button
                    InkWell(
                      onTap: () => onPressed(3),
                      child: SizedBox(
                        width: 60,
                        child: Column(
                          children: [
                            Icon(
                              _selectedIndex == 3
                                  ? Icons.person
                                  : Icons.person_outline,
                              color: _selectedIndex == 3
                                  ? AppColors.greenIcon
                                  : AppColors.darkGrey,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                  color: _selectedIndex == 3
                                      ? AppColors.greenIcon
                                      : AppColors.darkGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
              ],
            ),
            Positioned(
              bottom: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () => onPressed(4),
                    child: Image(
                      image: _selectedIndex == 4
                          ? const AssetImage(
                              "assets/Subtract-2.png",
                            )
                          : const AssetImage(
                              "assets/Vector.png",
                            ),
                      width: 28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void onPressed(index) {
    setState(() {
      _selectedIndex = -1;
      _selectedIndex = index;
      if (index == 0) {
        _selectedWidget = const HomeScreenTransport();
      } else if (index == 1) {
        _selectedWidget = const Favourite();
      } else if (index == 2) {
        _selectedWidget = const Offer();
      } else if (index == 3) {
        _selectedWidget = const Profile();
      } else if (index == 4) {
        _selectedWidget = const Wallet();
      }
    });
  }
}
