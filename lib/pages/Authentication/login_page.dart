import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_/bloc/authentication/log_in_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/model/authentication/Login_model.dart';
import 'package:rideshare_/pages/home_screen.dart';
import 'package:rideshare_/text_field.dart';
import 'package:rideshare_/service/auth/login_service.dart';
import 'package:rideshare_/text_button.dart';
import 'package:rideshare_/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordConfirmVisible = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInBloc(LoginService()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const BackButton(),
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Log in',
                style: TextStyle(
                  color: Color(0xFF414141),
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              MyTextField(controller: phone, hintText: "Phone"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: password,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  obscureText: passwordConfirmVisible,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(
                      color: Color(0xFFD0D0D0),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    suffixIcon:
                        togglePassword(passwordConfirmVisible, (newValue) {
                      setState(() {
                        passwordConfirmVisible = newValue;
                      });
                    }),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              BlocConsumer<LogInBloc, LogInState>(listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen(
                                selectedWidget: 0,
                              )));
                } else if (state is LoginException) {
                  return errorMessage(
                    context,
                    "Error",
                    [state.exceptionMessage],
                  );
                }
              }, builder: (context, state) {
                if (state is LoginSuccess) {
                  return Center(
                    child: Container(
                      height: 50,
                      width: 200,
                      color: AppColors.greenIcon,
                      child: const Text('Success'),
                    ),
                  );
                } else if (state is LogInInitial) {
                  return SizedBox(
                    width: 340,
                    height: 54,
                    child: Button(
                      text: 'Login',
                      onPressed: () {
                        if (password.text.isEmpty || phone.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill all fields'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          context.read<LogInBloc>().add(Login(
                              user: LoginModel(
                                  phone: phone.text, password: password.text)));
                        }
                      },
                    ),
                  );
                } else if (state is LoginException) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 340,
                          height: 54,
                          child: Button(
                            text: 'Login',
                            onPressed: () {
                              if (password.text.isEmpty || phone.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill all fields'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                context.read<LogInBloc>().add(Login(
                                    user: LoginModel(
                                        phone: phone.text,
                                        password: password.text)));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
            ],
          ),
        );
      }),
    );
  }
}
