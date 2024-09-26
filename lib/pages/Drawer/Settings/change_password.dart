import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_/bloc/settings/change_password_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/model/Settings/change_password_model.dart';
import 'package:rideshare_/pages/home_screen.dart';
import 'package:rideshare_/repo/settings/change_password_repo.dart';
import 'package:rideshare_/service/settings/change_password_service.dart';
import 'package:rideshare_/text_button.dart';
import 'package:rideshare_/widgets.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool oldPasswordVisible = true;
  bool newPasswordVisible = true;
  bool confirmPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(
        ChangePasswordRepo(
          service: ChangePasswordService(
            Dio(),
          ),
        ),
      ),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'Change password',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: oldPassword,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      obscureText: oldPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Old Password',
                        hintStyle: const TextStyle(
                          color: Color(0xFFD0D0D0),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        fillColor: Colors.white,
                        suffixIcon:
                            togglePassword(oldPasswordVisible, (newValue) {
                          setState(() {
                            oldPasswordVisible = newValue;
                          });
                        }),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: newPassword,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      obscureText: newPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        hintStyle: const TextStyle(
                          color: Color(0xFFD0D0D0),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        suffixIcon:
                            togglePassword(newPasswordVisible, (newValue) {
                          setState(() {
                            newPasswordVisible = newValue;
                          });
                        }),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: confirmPassword,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      obscureText: confirmPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(
                          color: Color(0xFFD0D0D0),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        suffixIcon:
                            togglePassword(confirmPasswordVisible, (newValue) {
                          setState(() {
                            confirmPasswordVisible = newValue;
                          });
                        }),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 56,
                      width: 340,
                      child:
                          BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                        listener: (context, state) {
                          if (state is SuccessChanging) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                                backgroundColor: AppColors.green,
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const HomeScreen(selectedWidget: 0),
                              ),
                            );
                          } else if (state is BadRequestChanging) {
                            return errorMessage(
                                context,
                                state.badRequest.status,
                                [state.badRequest.message]);
                          }
                        },
                        builder: (context, state) {
                          return Button(
                            text: "Change Password",
                            onPressed: () {
                              context.read<ChangePasswordBloc>().add(
                                    ChangePassword(
                                      changePasswordModel: ChangePasswordModel(
                                        currentPassword: oldPassword.text,
                                        newPassword: newPassword.text,
                                        confirmPassword: confirmPassword.text,
                                      ),
                                    ),
                                  );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 20,
                left: 1,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: const Text('Back'),
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
