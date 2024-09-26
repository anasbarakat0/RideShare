import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_/bloc/settings/privacy_policy_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/service/settings/privacy_policy_service.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PrivacyPolicyBloc(PrivacyPolicyService(Dio()))..add(SeePolicy()),
      child: Builder(builder: (context) {
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
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 95),
                ],
              ),
              const SizedBox(height: 30),
              BlocBuilder<PrivacyPolicyBloc, PrivacyPolicyState>(
                builder: (context, state) {
                  if (state is SuccessGettingPolicy) {
                    return Column(
                      children: [
                        Text(
                          state.privacyPolicyModel.body.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            state.privacyPolicyModel.body.description,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff717171),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is ExceptionGettingPolicy) {
                    return Text(state.message);
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
