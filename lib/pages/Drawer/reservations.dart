import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:rideshare_/bloc/reservation/bloc/update_to_finished_bloc.dart'
    as finished;
import 'package:rideshare_/bloc/reservation/delet_reservation_bloc.dart';
import 'package:rideshare_/bloc/reservation/update_to_during_reservation_bloc.dart';
import 'package:rideshare_/bloc/reservation/get_reservations_bloc.dart';
import 'package:rideshare_/bloc/transport/get_all_bicycles_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/model/reservation/get_reservations_model.dart';
import 'package:rideshare_/model/reservation/new_reservation_model.dart'
    as reservation;
import 'package:rideshare_/pages/Reservation/reservation_payment.dart';
import 'package:rideshare_/repo/bicycle/get_all_bicycle_repo.dart';
import 'package:rideshare_/repo/reservation/delet_reservation_repo.dart';
import 'package:rideshare_/repo/reservation/get_reservations_repo.dart';
import 'package:rideshare_/repo/reservation/update_to_during_reservation_repo.dart';
import 'package:rideshare_/repo/reservation/update_to_finished_repo.dart';
import 'package:rideshare_/service/reservation/update_to_during_reservation_service.dart';
import 'package:rideshare_/service/%20bicycle/get_all_bicycle_service.dart';
import 'package:rideshare_/service/reservation/delet_reservation_service.dart';
import 'package:rideshare_/service/reservation/get_reservations_service.dart';
import 'package:rideshare_/service/reservation/update_to_finished_service.dart';
import 'package:rideshare_/widgets.dart';

class Reservations extends StatefulWidget {
  const Reservations({super.key});

  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  bool selectText = true;
  int selectedIndex = 0;
  String reservationStatus = "PENDING";
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetReservationsBloc(
            GetReservationsRepo(
              getReservationsService: GetReservationsService(
                Dio(),
              ),
            ),
          )..add(GetReservation()),
        ),
        BlocProvider(
          create: (context) => GetAllBicyclesBloc(
            GetAllBicyclesRepo(
              getAllBicycleService: GetAllBicycleService(
                Dio(),
              ),
            ),
          )..add(GetAllBicycles()),
        ),
        BlocProvider(
          create: (context) => UpdateToDuringReservationBloc(
            UpdateToDuringReservationRepo(
              updateToDuringReservationService:
                  UpdateToDuringReservationService(
                Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => finished.UpdateToFinishedBloc(
            UpdateToFinishedRepo(
              updateToFinishedService: UpdateToFinishedService(
                Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => DeletReservationBloc(
            DeletReservationRepo(
              deletReservationService: DeletReservationService(
                Dio(),
              ),
            ),
          ),
        ),
        BlocListener<DeletReservationBloc, DeletReservationState>(
          listener: (context, state) {
            if (state is SuccessDeletReservation) {
              infoMessage(
                context,
                state.deletedModel.status,
                [state.deletedModel.message],
              );
            } else if (state is BadDeletedResponse) {
              errorMessage(
                context,
                state.badDeletModel.status,
                [state.badDeletModel.message],
              );
              context.read<GetReservationsBloc>().add(GetReservation());
            } else if (state is ExceptionDeletingResponse) {
              errorMessage(
                context,
                "Exception",
                [state.exceptionDeletModel.message],
              );
            }
            context.read<GetReservationsBloc>().add(GetReservation());
          },
        ),
        BlocListener<UpdateToDuringReservationBloc,
            UpdateToDuringReservationState>(
          listener: (context, state) {
            if (state is SuccessUpdating) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.updatedToDuringReservation.message,
                  ),
                  backgroundColor: AppColors.greenIcon,
                ),
              );
              context.read<GetReservationsBloc>().add(GetReservation());
            } else if (state is ExceptionUpdation) {
              if (state.exceptionRequest.badRequest != null) {
                return errorMessage(
                    context,
                    state.exceptionRequest.badRequest!.status,
                    [state.exceptionRequest.badRequest!.message]);
              } else {
                return errorMessage(
                    context,
                    state.exceptionRequest.conflictUpdate!.status,
                    [state.exceptionRequest.conflictUpdate!.message]);
              }
            }
          },
        ),
        BlocListener<finished.UpdateToFinishedBloc,
            finished.UpdateToFinishedState>(
          listener: (context, state) {
            if (state is finished.SuccessUpdating) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.updatedToFinished.message,
                  ),
                  backgroundColor: AppColors.greenIcon,
                ),
              );
              context.read<GetReservationsBloc>().add(GetReservation());
            } else if (state is finished.ExceptionUpdation) {
              if (state.exceptionRequest.badRequest != null) {
                return errorMessage(
                    context,
                    state.exceptionRequest.badRequest!.status,
                    [state.exceptionRequest.badRequest!.message]);
              } else {
                return errorMessage(
                    context,
                    state.exceptionRequest.conflictUpdate!.status,
                    [state.exceptionRequest.conflictUpdate!.message]);
              }
            }
          },
        ),
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
                    'Reservations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 95),
                ],
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 48,
                    width: 362,
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.greenIcon, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                              reservationStatus = "PENDING";
                            });
                          },
                          child: SizedBox(
                            width: 90,
                            child: Text(
                              'Pending',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                              reservationStatus = "NOT_STARTED";
                            });
                          },
                          child: SizedBox(
                            width: 90,
                            child: Text(
                              'Not Started',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                              reservationStatus = "DURING_RESERVATION";
                            });
                          },
                          child: SizedBox(
                            width: 90,
                            child: Text(
                              'During Reservation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                              reservationStatus = "FINISHED";
                            });
                          },
                          child: SizedBox(
                            width: 90,
                            child: Text(
                              'Finished',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: selectedIndex == 0
                        ? 0
                        : selectedIndex == 1
                            ? 90
                            : null,
                    right: selectedIndex == 2
                        ? 0
                        : selectedIndex == 3
                            ? 90
                            : null,
                    child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      width: 90,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        selectedIndex == 0
                            ? 'pending'
                            : selectedIndex == 1
                                ? 'Not Started'
                                : selectedIndex == 2
                                    ? "Finished"
                                    : "During Reservation",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BlocBuilder<GetReservationsBloc, GetReservationsState>(
                builder: (context, state) {
                  if (state is SuccessFetchingReservations) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.successGettingReservations.body.length,
                        itemBuilder: (context, index) {
                          if (state.successGettingReservations.body[index]
                                  .reservationStatus ==
                              reservationStatus) {
                            DateTime parsedDate = DateTime.parse(state
                                .successGettingReservations
                                .body[index]
                                .startTime);
                            String formattedDate =
                                DateFormat("yyyy/MM/dd HH:mm")
                                    .format(parsedDate);

                            DateTime parsedEndDate = DateTime.parse(state
                                    .successGettingReservations
                                    .body[index]
                                    .endTime ??
                                state.successGettingReservations.body[index]
                                    .startTime);
                            String formattedEndingDate =
                                DateFormat("yyyy/MM/dd HH:mm")
                                    .format(parsedEndDate);

                            return BlocConsumer<GetAllBicyclesBloc,
                                GetAllBicyclesState>(
                              listener: (context, state2) {},
                              builder: (context, state2) {
                                if (state2 is SuccessFetchAllBicycles) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        if (state
                                                .successGettingReservations
                                                .body[index]
                                                .reservationStatus ==
                                            "PENDING") {
                                          Body body = state
                                              .successGettingReservations
                                              .body[index];

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ReservationPayment(
                                                reservation: reservation
                                                    .ReservationSuccessRespond(
                                                        message: state
                                                            .successGettingReservations
                                                            .message,
                                                        status: state
                                                            .successGettingReservations
                                                            .status,
                                                        localDateTime: state
                                                            .successGettingReservations
                                                            .localDateTime,
                                                        body: reservation.Body
                                                            .fromMap(
                                                                body.toMap())),
                                                price: state2.bicycles!.body
                                                    .firstWhere(
                                                      (b) =>
                                                          b.modelPrice.model ==
                                                          state
                                                              .successGettingReservations
                                                              .body[index]
                                                              .bicycle,
                                                    )
                                                    .modelPrice
                                                    .price,
                                                model: state2.bicycles!.body
                                                    .firstWhere(
                                                      (b) =>
                                                          b.modelPrice.model ==
                                                          state
                                                              .successGettingReservations
                                                              .body[index]
                                                              .bicycle,
                                                    )
                                                    .modelPrice
                                                    .model,
                                                type: state2.bicycles!.body
                                                    .firstWhere(
                                                      (b) =>
                                                          b.modelPrice.model ==
                                                          state
                                                              .successGettingReservations
                                                              .body[index]
                                                              .bicycle,
                                                    )
                                                    .type,
                                                size: state2.bicycles!.body
                                                    .firstWhere(
                                                      (b) =>
                                                          b.modelPrice.model ==
                                                          state
                                                              .successGettingReservations
                                                              .body[index]
                                                              .bicycle,
                                                    )
                                                    .size,
                                                note: state2.bicycles!.body
                                                    .firstWhere(
                                                      (b) =>
                                                          b.modelPrice.model ==
                                                          state
                                                              .successGettingReservations
                                                              .body[index]
                                                              .bicycle,
                                                    )
                                                    .note,
                                                photoPath: state2.bicycles!.body
                                                    .firstWhere(
                                                      (b) =>
                                                          b.modelPrice.model ==
                                                          state
                                                              .successGettingReservations
                                                              .body[index]
                                                              .bicycle,
                                                    )
                                                    .photoPath,
                                              ),
                                            ),
                                          );
                                        } else if (state
                                                .successGettingReservations
                                                .body[index]
                                                .reservationStatus ==
                                            "NOT_STARTED") {
                                          functionDialog(
                                            context,
                                            (bool run) {
                                              if (run) {
                                                context
                                                    .read<
                                                        UpdateToDuringReservationBloc>()
                                                    .add(
                                                      UpdateDuring(
                                                        id: state
                                                            .successGettingReservations
                                                            .body[index]
                                                            .id,
                                                      ),
                                                    );
                                              }
                                            },
                                            "You are starting this reservation",
                                          );
                                        } else if (state
                                                .successGettingReservations
                                                .body[index]
                                                .reservationStatus ==
                                            "DURING_RESERVATION") {
                                          functionDialog(
                                            context,
                                            (bool run) {
                                              if (run) {
                                                context
                                                    .read<
                                                        finished
                                                        .UpdateToFinishedBloc>()
                                                    .add(
                                                      finished.UpdateFinished(
                                                        id: state
                                                            .successGettingReservations
                                                            .body[index]
                                                            .id,
                                                      ),
                                                    );
                                              }
                                            },
                                            "You are ending this reservation",
                                          );
                                        }
                                      },
                                      child: Slidable(
                                        startActionPane: ActionPane(
                                            motion: const StretchMotion(),
                                            children: [
                                              SlidableAction(
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          211, 47, 47, 1),
                                                  label: "Delete",
                                                  icon: Icons.delete,
                                                  onPressed: (context2) {
                                                    deletingDialog(
                                                      context,
                                                      (bool run) {
                                                        if (run) {
                                                          context
                                                              .read<
                                                                  DeletReservationBloc>()
                                                              .add(
                                                                DeletReservation(
                                                                  id: state
                                                                      .successGettingReservations
                                                                      .body[
                                                                          index]
                                                                      .id,
                                                                ),
                                                              );
                                                        }
                                                      },
                                                      "You are going to delet this reservation",
                                                    );
                                                  })
                                            ]),
                                        child: Container(
                                          width: 362,
                                          height: selectedIndex == 2 ? 104 : 64,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: selectedIndex == 0
                                                  ? Colors.amber
                                                  : AppColors.greenIcon,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          state
                                                              .successGettingReservations
                                                              .body[index]
                                                              .bicycle,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .darkGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Text(
                                                          "  ( from: ",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: AppColors
                                                                .greenIcon,
                                                          ),
                                                        ),
                                                        Text(
                                                          state
                                                              .successGettingReservations
                                                              .body[index]
                                                              .from,
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: AppColors
                                                                .greenIcon,
                                                          ),
                                                        ),
                                                        Text(
                                                          " to: ",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: AppColors
                                                                .greenIcon,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${state.successGettingReservations.body[index].to} )",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: AppColors
                                                                .greenIcon,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      formattedDate,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.grey,
                                                      ),
                                                    ),
                                                    state.successGettingReservations
                                                                .body[index].endTime !=
                                                            null
                                                        ? Text(
                                                            formattedEndingDate,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .greenIcon,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                    selectedIndex == 2
                                                        ? Container(
                                                            height: 20,
                                                            width: 50,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .green,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: const Text(
                                                              "Finished",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  ],
                                                ),
                                                Text(
                                                  overflow: TextOverflow.fade,
                                                  "${(state.successGettingReservations.body[index].price == state.successGettingReservations.body[index].price.toInt()) ? state.successGettingReservations.body[index].price.toInt() : state.successGettingReservations.body[index].price.toStringAsFixed(2)} S.P",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ),
                                    child: Container(
                                      width: 362,
                                      height: 64,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.amber,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: LinearProgressIndicator(),
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    );
                  } else if (state is ExceptionFetchingReservations) {
                    return Text(state.exceptionGettingReservations.message);
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
