import 'package:flutter/material.dart';
import 'package:rideshare_/colors.dart';

class SelectAvailableCar extends StatelessWidget {
  const SelectAvailableCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Row(
            children: [
              Icon(Icons.arrow_back),
              Text('Back'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Avaiable cars for ride",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "18 cars found",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffB8B8B8),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 170,
                width: 362,
                color: AppColors.lightGreen,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'BMW Cabrio',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Automatic   |   3 seats   |   Octane',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB8B8B8),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '800m (5mins away)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image(image: AssetImage('assets/BMW_Cabrio.png'))
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightGreen,
                          minimumSize: const Size(340, 54)),
                      child: const Text(
                        'View car list',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF008955),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 170,
                width: 362,
                color: AppColors.lightGreen,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Mustang Shelby GT',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Automatic   |   3 seats   |   Octane',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB8B8B8),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '800m (5mins away)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image(image: AssetImage('assets/Mustang_Shelby_GT.png'))
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightGreen,
                          minimumSize: const Size(340, 54)),
                      child: const Text(
                        'View car list',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF008955),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 170,
                width: 362,
                color: AppColors.lightGreen,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'BMW 18',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Automatic   |   3 seats   |   Octane',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB8B8B8),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '800m (5mins away)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image(image: AssetImage('assets/BMW_18.png'))
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightGreen,
                          minimumSize: const Size(340, 54)),
                      child: const Text(
                        'View car list',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF008955),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 170,
                width: 362,
                color: AppColors.lightGreen,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Jaguar Silber',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Automatic   |   3 seats   |   Octane',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB8B8B8),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '800m (5mins away)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image(image: AssetImage('assets/Jaguar_Silber.png'))
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightGreen,
                          minimumSize: const Size(340, 54)),
                      child: const Text(
                        'View car list',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF008955),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
