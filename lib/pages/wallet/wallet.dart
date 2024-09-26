import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rideshare_/bloc/wallet/create_new_wallet_bloc.dart';
import 'package:rideshare_/bloc/wallet/get_my_wallet_info_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/pages/wallet/add_amount.dart';
import 'package:rideshare_/pages/notifecation.dart';
import 'package:rideshare_/pages/wallet/create_wallet_window.dart';
import 'package:rideshare_/repo/wallet/create_new_wallet_repo.dart';
import 'package:rideshare_/repo/wallet/get_my_wallet_info_repo.dart';
import 'package:rideshare_/service/wallet/create_new_wallet_service.dart';
import 'package:rideshare_/service/wallet/get_my_wallet_info_service.dart';
import 'package:rideshare_/text_button.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetMyWalletInfoBloc(GetMyWalletInfoRepo(
              getMyWalletInfoService: GetMyWalletInfoService(Dio())))
            ..add(GetInfo()),
        ),
        BlocProvider(
          create: (context) => CreateNewWalletBloc(CreateNewWalletRepo(
              createNewWalletService: CreateNewWalletService(Dio()))),
        ),
      ],
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 124),
                  Container(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 171,
                      height: 54,
                      child: BlocBuilder<GetMyWalletInfoBloc,
                          GetMyWalletInfoState>(
                        builder: (context, state) {
                          if (state is SuccessGettingMyWalletInfo) {
                            return BorderButton(
                              text: 'Add Money',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddAmountPage()));
                              },
                            );
                          } else {
                            return BorderButton(
                              text: 'Add Money',
                              onPressed: () {},
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<GetMyWalletInfoBloc, GetMyWalletInfoState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is GetMyWalletInfoInitial) {
                        return Column(
                          children: [
                            Container(
                              height: 145,
                              width: 358,
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.greenIcon,
                                  width: 1,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 19, vertical: 35),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    LinearProgressIndicator(),
                                    LinearProgressIndicator(),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const LinearProgressIndicator(),
                          ],
                        );
                      } else if (state is SuccessGettingMyWalletInfo) {
                        return Column(
                          children: [
                            Container(
                              height: 145,
                              width: 358,
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.greenIcon,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 19, vertical: 35),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${NumberFormat('#,###').format(state.walletInfoModel.body.balance)} S.P",
                                      style: TextStyle(
                                        color: AppColors.typeGrey,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Available Balance",
                                      style: TextStyle(
                                        color: AppColors.typeGrey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              state.walletInfoModel.body.bankAccount,
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      } else if (state is NoWalletToShowState) {
                        return Column(
                          children: [
                            Container(
                              height: 145,
                              width: 358,
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.greenIcon,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      state.message,
                                      style: TextStyle(
                                        color: AppColors.typeGrey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 171,
                                      height: 54,
                                      child: Button(
                                        text: "Create Wallet",
                                        onPressed: () async {
                                          bool refresh =
                                              await creatWallet(context);
                                          if (refresh) {
                                            context
                                                .read<GetMyWalletInfoBloc>()
                                                .add(GetInfo());
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is ExceptionGettingMyWalletInfo) {
                        return Column(
                          children: [
                            Container(
                              height: 145,
                              width: 358,
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.greenIcon,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 19, vertical: 35),
                                child: Center(
                                  child: Text(
                                    state.message,
                                    style: TextStyle(
                                      color: AppColors.typeGrey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Container(
                              height: 145,
                              width: 358,
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.greenIcon,
                                  width: 1,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 19, vertical: 35),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircularProgressIndicator(),
                                    CircularProgressIndicator(),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const CircularProgressIndicator(),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transections',
                        style: TextStyle(
                          color: Color(0xFF121212),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              color: Color(0xFF007848),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Builder(builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.menu_outlined),
                        );
                      }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotifecationPage()));
                        },
                        icon: const Icon(Icons.notifications_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
