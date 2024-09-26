import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_/features/wallet/presentation/bloc/add_money_to_my_wallet_bloc.dart';
import 'package:rideshare_/core/resources/colors.dart';
import 'package:rideshare_/features/wallet/presentation/bloc/get_all_valid_codes_bloc.dart';
import 'package:rideshare_/temp/pages/home_screen.dart';
import 'package:rideshare_/text_field.dart';
import 'package:rideshare_/features/wallet/data/repository/add_money_to_my_wallet_repo.dart';
import 'package:rideshare_/features/wallet/data/repository/get_all_valid_codes_repo.dart';
import 'package:rideshare_/features/wallet/presentation/view/message_valid_codes.dart';
import 'package:rideshare_/features/wallet/data/sources/remote/add_money_to_my_wallet_service.dart';
import 'package:rideshare_/features/wallet/data/sources/remote/get_all_valid_codes_service.dart';
import 'package:rideshare_/text_button.dart';

class AddAmountPage extends StatefulWidget {
  const AddAmountPage({super.key});

  @override
  State<AddAmountPage> createState() => _AddAmountPageState();
}

class _AddAmountPageState extends State<AddAmountPage> {
  TextEditingController code = TextEditingController();

  void useCode(newcode) {
    setState(() {
      code.text = newcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddMoneyToMyWalletBloc>(
            create: (context) => AddMoneyToMyWalletBloc(AddMoneyToMyWalletRepo(
                addMoneyToMyWalletService: AddMoneyToMyWalletService(Dio())))),
        BlocProvider<GetAllValidCodesBloc>(
            create: (context) => GetAllValidCodesBloc(GetAllValidCodesRepo(
                getAllValidCodesService: GetAllValidCodesService(Dio())))),
      ],
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
                    'Amount',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 95),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyTextField(controller: code, hintText: "Enter Code"),
                        BlocConsumer<GetAllValidCodesBloc,
                            GetAllValidCodesState>(
                          listener: (context, state) {
                            if (state is GettingValidCodes) {
                              showValidCodes(context, state.getValidCodes.body,
                                  (selectedCode) {
                                useCode(selectedCode);
                              });
                            } else if (state is GettingNoCode) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.amber,
                                      content: Text(
                                        'There is no Valid Codes!',
                                        style: TextStyle(
                                            color: AppColors.darkGrey),
                                      )));
                            } else if (state is ExceptionWhileGettingCodes) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(state
                                          .exceptionGettingCodes.message)));
                            }
                          },
                          builder: (context, state) {
                            if (state is LoadingGettingCodes) {
                              return const Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: SizedBox(
                                    width: 70,
                                    child: LinearProgressIndicator()),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: TextButton(
                                    onPressed: () {
                                      context
                                          .read<GetAllValidCodesBloc>()
                                          .add(GetCodes());
                                    },
                                    child: const Text('Get Valid Codes')),
                              );
                            }
                          },
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 54,
                          width: 340,
                          child: BlocConsumer<AddMoneyToMyWalletBloc,
                              AddMoneyToMyWalletState>(
                            listener: (context, state) {
                              if (state is SuccessAddingMoney) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.greenIcon,
                                    content:
                                        Text(state.validCodesModel.message),
                                  ),
                                );
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomeScreen(
                                            selectedWidget: 4)));
                              }
                              if (state is UnvalidForAddingMoney) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content:
                                        Text(state.unValidCodeModel.message),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is AddMoneyToMyWalletInitial) {
                                return Button(
                                  text: 'Confirm',
                                  onPressed: () {
                                    context
                                        .read<AddMoneyToMyWalletBloc>()
                                        .add(AddMoney(code: code.text));
                                  },
                                );
                              } else if (state is SuccessAddingMoney) {
                                return const Center();
                              } else if (state is UnvalidForAddingMoney) {
                                return Button(
                                  text: 'Confirm',
                                  onPressed: () {
                                    context
                                        .read<AddMoneyToMyWalletBloc>()
                                        .add(AddMoney(code: code.text));
                                  },
                                );
                              } else if (state is ExceptioAddingMoney) {
                                return Column(
                                  children: [
                                    Text(state.exceptionCode.message),
                                    SizedBox(
                                      height: 34,
                                      width: 300,
                                      child: Button(
                                        text: 'Confirm',
                                        onPressed: () {
                                          context
                                              .read<AddMoneyToMyWalletBloc>()
                                              .add(AddMoney(code: code.text));
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 42,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
