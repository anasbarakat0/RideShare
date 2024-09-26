import 'package:flutter/material.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/pages/Authentication/login_page.dart';
import 'package:rideshare_/pages/Authentication/setpassword.dart';
import 'package:rideshare_/text_field.dart';
import 'package:rideshare_/text_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool? terms = true;
  TextEditingController username = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Sign up with your email or phone number',
                  style: TextStyle(
                    color: Color(0xFF414141),
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
              MyTextField(controller: firstName, hintText: 'First Name'),
              MyTextField(controller: lastName, hintText: 'Last Name'),
              MyPhoneField(
                controller: phone,
                hintText: 'Your mobile number',
              ),
              MyTextField(controller: username, hintText: 'Username'),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Birth Date',
                      hintStyle: const TextStyle(
                        color: Color(0xFFD0D0D0),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                  onTap: _selectDate,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: DropdownButtonFormField(
              //       decoration: InputDecoration(
              //           labelText: 'Gender',
              //           labelStyle: TextStyle(color: Colors.grey[350]),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(6),
              //           )),
              //       value: value,
              //       items: const [
              //         DropdownMenuItem(
              //           value: '1',
              //           child: Text('male'),
              //         ),
              //         DropdownMenuItem(
              //           value: '2',
              //           child: Text('female'),
              //         ),
              //         DropdownMenuItem(
              //           value: '3',
              //           child: Text('other'),
              //         ),
              //       ],
              //       onChanged: (v) {}),
              // ),
              const SizedBox(height: 20),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: terms,
              //       onChanged: (Value) {
              //         setState(
              //           () {
              //             terms = Value!;
              //           },
              //         );
              //       },
              //     ),
              //     const SizedBox(width: 5.5),
              //     const Text(
              //       'remember me   ',
              //       style: TextStyle(
              //         fontSize: 15,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          terms = !terms!;
                        });
                      },
                      child: terms!
                          ? Icon(
                              Icons.check_circle_outline,
                              size: 30,
                              color: AppColors.green,
                            )
                          : Icon(
                              Icons.circle_outlined,
                              size: 30,
                              color: AppColors.green,
                            ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 65,
                      child: const Text(
                        "By signing up, you agree to the Terms of Service and Privacy Policy.",
                        style: TextStyle(
                          color: Color(0xFFB8B8B8),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 340,
                height: 54,
                child: Button(
                  text: 'Sign Up',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetPassword(
                                firstName: firstName.text,
                                lastName: lastName.text,
                                username: username.text,
                                phone: phone.text,
                                birthDate: dateController.text)));
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 156,
                    height: 1,
                    color: const Color(0xFFB8B8B8),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'or',
                    style: TextStyle(
                      color: Color(0xFFB8B8B8),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 156,
                    height: 1,
                    color: const Color(0xFFB8B8B8),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Color(0xFF008955),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
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

  Future<void> _selectDate() async {
    DateTime? picker = await showDatePicker(
      context: context,
      firstDate: DateTime(1960),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picker != null) {
      setState(() {
        dateController.text = picker.toString().split(" ")[0];
      });
    }
  }
}
