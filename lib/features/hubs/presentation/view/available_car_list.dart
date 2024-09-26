import 'package:flutter/material.dart';
import 'package:rideshare_/core/resources/colors.dart';

class AvailableCarList extends StatelessWidget {
  const AvailableCarList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text('Back'),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Column(
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
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightGreen,
                            minimumSize: const Size(165, 54)),
                        child: const Text(
                          'Book later',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF008955),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0XFF008955),
                            minimumSize: const Size(165, 54)),
                        child: const Text(
                          'Ride Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
