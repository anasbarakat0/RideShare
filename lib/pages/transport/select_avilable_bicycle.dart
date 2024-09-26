import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rideshare_/bloc/favourite/add_favourite_bloc.dart';
import 'package:rideshare_/bloc/transport/get_all_bicycles_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/pages/Reservation/request_reservation.dart';
import 'package:rideshare_/repo/bicycle/get_all_bicycle_repo.dart';
import 'package:rideshare_/repo/favourite/add_favourite_repo.dart';
import 'package:rideshare_/service/%20bicycle/get_all_bicycle_service.dart';
import 'package:rideshare_/service/favourite/add_favourite_service.dart';
import 'package:rideshare_/text_button.dart';
import 'package:rideshare_/widgets.dart';

class SelectAvilableBicyclePage extends StatefulWidget {
  final int fromId;
  final int toId;
  final String fromName;
  final String toName;
  final String roadBikes;

  const SelectAvilableBicyclePage(
      {super.key,
      required this.fromId,
      required this.toId,
      required this.fromName,
      required this.toName,
      required this.roadBikes});

  @override
  State<SelectAvilableBicyclePage> createState() =>
      _SelectAvilableBicyclePageState();
}

class _SelectAvilableBicyclePageState extends State<SelectAvilableBicyclePage> {
  Position? _currentPosition;

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _currentPosition = await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  int fromHubId = -1;
  int toHubId = -1;
  late String startingDateTime;

  String selectTimeTitle = 'Select Time';
//
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllBicyclesBloc(
            GetAllBicyclesRepo(
              getAllBicycleService: GetAllBicycleService(
                Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => AddFavouriteBloc(
            AddFavouriteRepo(
              addFavouriteService: AddFavouriteService(
                Dio(),
              ),
            ),
          ),
        ),
        BlocListener<AddFavouriteBloc, AddFavouriteState>(
            listener: (context, state) {
          if (state is AddedToFavourite) {
            infoMessage(
              context,
              state.favouriteRespond.status,
              [state.favouriteRespond.message],
            );
            context.read<GetAllBicyclesBloc>().add(
                  GetAllBicyclesByHub(
                    id: widget.fromId,
                    bicycleCategory: widget.roadBikes,
                  ),
                );
          } else if (state is BadResponse) {
            errorMessage(
              context,
              state.badFavoriteRespond.status,
              [state.badFavoriteRespond.message],
            );
          } else if (state is ExceptionRespond) {
            errorMessage(
              context,
              "Exception",
              [state.exceptionFavoriteRespond.message],
            );
          }
        })
      ],
      child: Builder(builder: (context) {
        context.read<GetAllBicyclesBloc>().add(GetAllBicyclesByHub(
            id: widget.fromId, bicycleCategory: widget.roadBikes));
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const FittedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.arrow_back_ios_new_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 26, top: 30, bottom: 8),
                child: Text(
                  "Avaiable bicycle for ride",
                  style: TextStyle(
                    color: AppColors.darkGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              BlocConsumer<GetAllBicyclesBloc, GetAllBicyclesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetAllBicyclesInitial) {
                    return const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Wait for few seconds'),
                        ],
                      ),
                    );
                  } else if (state is SuccessFetchAllBicycles) {
                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 26, bottom: 30),
                            child: Text(
                              '${state.bicyclesHub!.body.bicycleList.length} bicycle found',
                              style: const TextStyle(
                                color: Color(0xFFb8b8b8),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.builder(
                                itemCount:
                                    state.bicyclesHub!.body.bicycleList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      height: 170,
                                      width: 363,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightGreen,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppColors.greenIcon,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 16),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          state
                                                              .bicyclesHub!
                                                              .body
                                                              .bicycleList[
                                                                  index]
                                                              .model_price
                                                              .model,
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .darkGrey,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          "( ${state.bicyclesHub!.body.bicycleList[index].model_price.price.toString()} )",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .green,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          state
                                                              .bicyclesHub!
                                                              .body
                                                              .bicycleList[
                                                                  index]
                                                              .type,
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .darkGrey,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Text(
                                                          '  |  ',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .darkGrey,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Text(
                                                          state
                                                              .bicyclesHub!
                                                              .body
                                                              .bicycleList[
                                                                  index]
                                                              .size
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .darkGrey,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      state
                                                          .bicyclesHub!
                                                          .body
                                                          .bicycleList[index]
                                                          .note,
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.green,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: 59,
                                                    width: 101,
                                                    child: Image.network(
                                                      "https://${state.bicyclesHub!.body.bicycleList[index].photoPath}",
                                                      fit: BoxFit.cover,
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object exception,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return const Icon(Icons
                                                            .image_not_supported_rounded);
                                                      },
                                                    )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 274,
                                                  height: 54,
                                                  child: BorderButton(
                                                    text: 'Book the bike',
                                                    onPressed: () {
                                                      _getCurrentLocation();
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              RequestReservation(
                                                            currentPosition:
                                                                _currentPosition!,
                                                            bicycleHub: state
                                                                    .bicyclesHub!
                                                                    .body
                                                                    .bicycleList[
                                                                index],
                                                            fromId:
                                                                widget.fromId,
                                                            toId: widget.toId,
                                                            fromName:
                                                                widget.fromName,
                                                            toName:
                                                                widget.toName,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  height: 54,
                                                  width: 54,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        54,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          spreadRadius: 0.3,
                                                          blurRadius: 1,
                                                          offset: const Offset(
                                                              1, 1),
                                                        )
                                                      ]),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              AddFavouriteBloc>()
                                                          .add(
                                                            AddFavourite(
                                                              id: state
                                                                  .bicyclesHub!
                                                                  .body
                                                                  .bicycleList[
                                                                      index]
                                                                  .id,
                                                            ),
                                                          );
                                                    },
                                                    icon: Icon(
                                                      state
                                                              .bicyclesHub!
                                                              .body
                                                              .bicycleList[
                                                                  index]
                                                              .isFavourite
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_outline,
                                                      color: AppColors.green,
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
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is FetchingEmptyBicycles) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is ExceptionGettingBicycles) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(state.message),
                      ),
                    );
                  } else if (state is LoadingWhileGettingAllBicycles) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: LinearProgressIndicator(),
                    );
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
