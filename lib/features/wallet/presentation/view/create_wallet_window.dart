import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_/features/wallet/presentation/bloc/create_new_wallet_bloc.dart';
import 'package:rideshare_/core/resources/colors.dart';
import 'package:rideshare_/features/wallet/data/model/create_new_wallet_model.dart';
import 'package:rideshare_/text_field.dart';
import 'package:rideshare_/features/wallet/data/repository/create_new_wallet_repo.dart';
import 'package:rideshare_/features/wallet/data/sources/remote/create_new_wallet_service.dart';
import 'package:rideshare_/text_button.dart';
import 'package:rideshare_/widgets.dart';

Future<bool> creatWallet(BuildContext context) async {
  TextEditingController bankAccount = TextEditingController();
  TextEditingController securityCode = TextEditingController();
  TextEditingController confirmSecurityCode = TextEditingController();

  List<String> error = [];

  bool visable = true;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return BlocProvider(
            create: (context) => CreateNewWalletBloc(CreateNewWalletRepo(
                createNewWalletService: CreateNewWalletService(Dio()))),
            child: AlertDialog(
              title: const Text('Create Your Wallet'),
              backgroundColor: Colors.white,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: bankAccount,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Bank Account',
                        hintStyle: const TextStyle(
                          color: Color(0xFFD0D0D0),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                  ),
                  const SizedBox(height: 10),
                  PasswordTextField(
                      controller: securityCode,
                      visable: visable,
                      hintText: 'Security Code'),
                  const SizedBox(height: 10),
                  PasswordTextField(
                      controller: confirmSecurityCode,
                      visable: visable,
                      hintText: 'Confirm Security Code'),
                  const SizedBox(height: 20),
                  BlocConsumer<CreateNewWalletBloc, CreateNewWalletState>(
                    listener: (context, state) {
                      if (state is BadRequestCreateWallet) {
                        errorMessage(context, state.response.status,
                            state.response.message);
                      }
                      if (state is ExceptionCreateWallet) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.message.message),
                        ));
                      } else if (state is SuccessCreateWallet) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.response.message),
                            backgroundColor: AppColors.greenIcon,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is SuccessCreateWallet) {
                        return SizedBox(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          child: Button(
                            text: "Done",
                            onPressed: () {},
                          ),
                        );
                      } else if (state is LoadingCreateWallet) {
                        return const CircularProgressIndicator();
                      } else {
                        return SizedBox(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          child: Button(
                            text: 'Create Wallet',
                            onPressed: () {
                              context.read<CreateNewWalletBloc>().add(
                                    CreateNewWallet(
                                      createNewWalletModel:
                                          CreateNewWalletModel(
                                        bankAccount: bankAccount.text,
                                        securityCode: securityCode.text,
                                        confirmSecurityCode:
                                            confirmSecurityCode.text,
                                      ),
                                    ),
                                  );
                            },
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    child: Expanded(
                      child: BorderButton(
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  error == []
                      ? FittedBox(
                          child: ListView.builder(
                            itemCount: error.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: AppColors.greenIcon,
                                child: ListTile(
                                  title: Text(error[index]),
                                ),
                              );
                            },
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
      );
    },
  );
  return true;
}
