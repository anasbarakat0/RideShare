import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_/bloc/offer/get_offers_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/repo/offer/get_offers_repo.dart';
import 'package:rideshare_/service/offer/get_offers_service.dart';

class Offer extends StatefulWidget {
  const Offer({super.key});

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOffersBloc(
        GetOffersRepo(
          getOffersService: GetOffersService(
            Dio(),
          ),
        ),
      )..add(GetOffers()),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              SizedBox(
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
                      const Text(
                        'Offers',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 34,
                        width: 34,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<GetOffersBloc, GetOffersState>(
                builder: (context, state) {
                  if (state is SuccessGettingOffers) {
                    return Flexible(
                      child: ListView.builder(
                        itemCount: state.getAllOffers.body.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 4),
                            child: Container(
                              height: 93,
                              width: 363,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.greenIcon,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 16,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  state.getAllOffers.body[index]
                                                      .model_price.model,
                                                  style: TextStyle(
                                                      color: AppColors.darkGrey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "( ${state.getAllOffers.body[index].model_price.price.toString()} S.P )",
                                                  style: const TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  state.getAllOffers.body[index]
                                                      .type,
                                                  style: TextStyle(
                                                      color: AppColors.darkGrey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  '  |  ',
                                                  style: TextStyle(
                                                      color: AppColors.darkGrey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  state.getAllOffers.body[index]
                                                      .size
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: AppColors.darkGrey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              state.getAllOffers.body[index]
                                                  .note,
                                              style: TextStyle(
                                                  color: AppColors.green,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 59,
                                          width: 101,
                                          child: Image.network(
                                            "https://${state.getAllOffers.body[index].photoPath}",
                                            fit: BoxFit.cover,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return const Icon(Icons
                                                  .image_not_supported_rounded);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is BadStateOffer) {
                    return Text(state.badOfferRespond.message);
                  } else if (state is ExceptionStateOffer) {
                    return Text(state.exceptionOfferRespond.message);
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
