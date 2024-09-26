// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:rideshare_/features/hubs/presentation/bloc/get_all_hubs_bloc.dart';
import 'package:rideshare_/features/reservations/presentation/bloc/new_reservation_bloc.dart';
import 'package:rideshare_/core/resources/colors.dart';
import 'package:rideshare_/features/bicycles/data/model/bicycle_by_hub_model.dart';
import 'package:rideshare_/features/bicycles/data/model/bicycle_respond_model.dart'
    as body;
import 'package:rideshare_/features/reservations/data/model/new_reservation_model.dart';
import 'package:rideshare_/features/reservations/presentation/view/reservation_payment.dart';
import 'package:rideshare_/features/hubs/data/repository/get_all_hubs_repo.dart';
import 'package:rideshare_/features/reservations/data/repository/new_reservation_repo.dart';
import 'package:rideshare_/features/hubs/data/sources/remote/get_all_hubs_service.dart';
import 'package:rideshare_/features/reservations/data/sources/remote/new_reservation_service.dart';
import 'package:rideshare_/text_button.dart';
import 'package:rideshare_/widgets.dart';

class RequestReservation extends StatefulWidget {
  final int fromId;
  final int toId;
  final String fromName;
  final String toName;
  final Position currentPosition;
  final body.Body? bicycle;
  final BicycleList? bicycleHub;
  const RequestReservation({
    super.key,
    required this.fromId,
    required this.toId,
    required this.fromName,
    required this.toName,
    required this.currentPosition,
    this.bicycle,
    this.bicycleHub,
  });

  @override
  State<RequestReservation> createState() => _RequestReservationState();
}

class _RequestReservationState extends State<RequestReservation> {
  TextEditingController startingTimeController = TextEditingController();
  TextEditingController endingTimeController = TextEditingController();
  late String endingDateTime;
  bool showLess = true;
  late TimeOfDay? EndingTime;
  late String startingDateTime;
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  double duration = 0.0;

  void showDateTimePicker() async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        setState(() {
          final DateTime selectedDateTime = DateTime(
            selectedDate!.year,
            selectedDate!.month,
            selectedDate!.day,
            selectedTime!.hour,
            selectedTime!.minute,
          );

          final DateTime currentDateTime = DateTime.now();

          if (selectedDateTime.toString() ==
              DateFormat("yyyy-MM-dd HH:mm:00.000").format(DateTime.now())) {
            final String formattedDateTime =
                DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                    .format(selectedDateTime);
            startingDateTime = formattedDateTime;
            startingTimeController.text =
                DateFormat("dd/MM/yyyy HH:mm").format(selectedDateTime);
            return;
          }
          if (selectedDateTime.isBefore(currentDateTime)) {
            errorMessage(context, 'Error Input',
                ["You can't choose a date and time in the past"]);
          } else {
            final String formattedDateTime =
                DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                    .format(selectedDateTime);
            startingDateTime = formattedDateTime;
            startingTimeController.text =
                DateFormat("dd/MM/yyyy HH:mm").format(selectedDateTime);
          }
        });
      }
    }
  }

  void timePicker() async {
    EndingTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (EndingTime != null) {
      setState(() {
        duration = ((((EndingTime!.hour - selectedTime!.hour) * 60) +
                    (EndingTime!.minute - selectedTime!.minute)) /
                60)
            .toDouble();
        final DateTime endingDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          EndingTime!.hour,
          EndingTime!.minute,
        );
        endingTimeController.text =
            DateFormat("dd/MM/yyyy HH:mm").format(endingDateTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request For Rent'),
        backgroundColor: Colors.white,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GetAllHubsBloc(
                  GetAllHubsRepo(getAllHubsService: GetAllHubsService(Dio())))),
          BlocProvider(
              create: (context) => NewReservationBloc(NewReservationRepo(
                  newReservationService: NewReservationService(Dio())))),
        ],
        child: Builder(
          builder: (context) {
            context.read<GetAllHubsBloc>().add(GetAllHubs(
                lon: widget.currentPosition.longitude,
                lat: widget.currentPosition.latitude));
            return BlocConsumer<GetAllHubsBloc, GetAllHubsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetAllHubsInitial) {
                  return const Center(
                    child: Text('wait few seconds'),
                  );
                } else if (state is SuccessGettingAllHubs) {
                  return SingleChildScrollView(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Color(0xfff44336),
                                        ),
                                        SvgPicture.asset("line.svg"),
                                        Icon(
                                          Icons.location_on,
                                          color: AppColors.greenIcon,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 6),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'From',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.typeGrey,
                                          ),
                                        ),
                                        Text(
                                          widget.fromName,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 33),
                                        Text(
                                          'To',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.typeGrey,
                                          ),
                                        ),
                                        Text(
                                          widget.toName,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                height: 93,
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
                                                    widget.bicycleHub!
                                                        .model_price.model,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkGrey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    "( ${widget.bicycleHub!.model_price.price.toString()} S.P )",
                                                    style: TextStyle(
                                                        color: AppColors.green,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    widget.bicycleHub!.type,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkGrey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    '  |  ',
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkGrey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    widget.bicycleHub!.size
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkGrey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                widget.bicycleHub!.note,
                                                style: TextStyle(
                                                    color: AppColors.green,
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
                                                "https://${widget.bicycleHub!.photoPath}",
                                                fit: BoxFit.cover,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return const Icon(Icons
                                                      .image_not_supported_rounded);
                                                },
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                child: TextField(
                                  controller: startingTimeController,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      hintText: 'Select Time',
                                      hintStyle: const TextStyle(
                                        color: Color(0xFFD0D0D0),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      )),
                                  readOnly: true,
                                  onTap: showDateTimePicker,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 10, 16, 10),
                                child: TextField(
                                  controller: endingTimeController,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      hintText: 'Select Ending Time',
                                      hintStyle: const TextStyle(
                                        color: Color(0xFFD0D0D0),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      )),
                                  readOnly: true,
                                  onTap: timePicker,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(),
                              const SizedBox(height: 14),
                              Padding(
                                padding: const EdgeInsets.only(left: 17),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Recent places',
                                        style: TextStyle(
                                          color: AppColors.darkGrey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              showLess = !showLess;
                                            });
                                          },
                                          child: Text(showLess
                                              ? 'See All'
                                              : 'Show Less'))
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              showLess
                                  ? const SizedBox()
                                  : Column(
                                      children: List.generate(
                                          state.hubs.body.length, (index) {
                                        return ListTile(
                                          title: Text(
                                            state.hubs.body[index].name,
                                            style: TextStyle(
                                              color: AppColors.darkGrey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                          subtitle: Text(
                                            state.hubs.body[index].description,
                                            style: TextStyle(
                                              color: AppColors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                          leading:
                                              const Icon(Icons.location_on),
                                        );
                                      }),
                                    ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 56,
                                width: 340,
                                child: BlocConsumer<NewReservationBloc,
                                    NewReservationState>(
                                  listener: (context, state) {
                                    if (state is BadRequiestReservation) {
                                      return errorMessage(
                                          context, "Bad Request", [
                                        state.reservationBadRequest.message
                                      ]);
                                    } else if (state is ReservationDone) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ReservationPayment(
                                            reservation:
                                                state.reservationSuccessRespond,
                                            price: widget
                                                .bicycleHub!.model_price.price,
                                            model: widget
                                                .bicycleHub!.model_price.model,
                                            type: widget.bicycleHub!.type,
                                            size: widget.bicycleHub!.size,
                                            note: widget.bicycleHub!.note,
                                            photoPath:
                                                widget.bicycleHub!.photoPath,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    return Button(
                                      text: 'Confirm Booking',
                                      onPressed: () {
                                        if (duration > 0.0) {
                                          context
                                              .read<NewReservationBloc>()
                                              .add(
                                                NewReservationReq(
                                                  NewReservationModel(
                                                    bicycleId:
                                                        widget.bicycleHub!.id,
                                                    fromHubId: widget.fromId,
                                                    toHubId: widget.toId,
                                                    duration: duration,
                                                    startTime: startingDateTime,
                                                    paymentMethod: "Wallet",
                                                  ),
                                                ),
                                              );
                                        } else {
                                          errorMessage(context, "Worning", [
                                            "you can't choose the ending time before the starting time"
                                          ]);
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 34),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is EmptyHubs) {
                  return Center(child: Text(state.message));
                } else if (state is ExceptionGettingAllHubs) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        ),
      ),
    );
  }
}
