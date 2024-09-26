import 'package:flutter/material.dart';
import 'package:rideshare_/colors.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Mustang Shelby GT",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "4.9 (531 reviews)",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffB8B8B8)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/cardetails.png"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Specifications",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 77,
                    height: 75,
                    color: AppColors.lightGreen,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset("assets/Max_Power.png"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Max. power',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          '2500hp',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 77,
                    height: 75,
                    color: AppColors.lightGreen,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset("assets/Fual.png"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Fuel',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          '10km per litre',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 77,
                    height: 75,
                    color: AppColors.lightGreen,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset("assets/Speed.png"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Max. speed',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          '230kph',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 77,
                    height: 75,
                    color: AppColors.lightGreen,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset("assets/mph.png"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '0-60mph',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          '2.5sec',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Car features",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 362,
                height: 44,
                color: AppColors.lightGreen,
                child: const ListTile(
                  leading: Text(
                    "Model",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Text(
                    "GT5000",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 362,
                height: 44,
                color: AppColors.lightGreen,
                child: const ListTile(
                  leading: Text(
                    "Capacity",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Text(
                    "760hp",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 362,
                height: 44,
                color: AppColors.lightGreen,
                child: const ListTile(
                  leading: Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Text(
                    "Red",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 362,
                height: 44,
                color: AppColors.lightGreen,
                child: const ListTile(
                  leading: Text(
                    "Fuel type",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Text(
                    "Octane",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 362,
                height: 44,
                color: AppColors.lightGreen,
                child: const ListTile(
                  leading: Text(
                    "Gear type",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Text(
                    "Gear type",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // context.go('/CarDetails');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(177, 54)),
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
                        minimumSize: const Size(177, 54)),
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
    );
  }
}
