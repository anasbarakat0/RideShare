import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:rideshare_/bloc/reservation/reservation_payment_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/model/reservation/new_reservation_model.dart';
import 'package:rideshare_/model/reservation/reservation_payment_model.dart';
import 'package:rideshare_/pages/Reservation/thank_you.dart';
import 'package:rideshare_/repo/reservation/reservation_payment_repo.dart';
import 'package:rideshare_/service/reservation/resrvation_payment_service.dart';
import 'package:rideshare_/text_button.dart';
import 'package:rideshare_/widgets.dart';

class ReservationPayment extends StatefulWidget {
  final ReservationSuccessRespond reservation;
  final double price;
  final String model;
  final String type;
  final int size;
  final String note;
  final String photoPath;
  const ReservationPayment({
    super.key,
    required this.reservation,
    required this.price,
    required this.model,
    required this.type,
    required this.size,
    required this.note,
    required this.photoPath,
  });

  @override
  State<ReservationPayment> createState() => _ReservationPaymentState();
}

class _ReservationPaymentState extends State<ReservationPayment> {
  TextEditingController password = TextEditingController();
  bool passwordConfirmVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationPaymentBloc(
        ReservationPaymentRepo(
          resrvationPaymentService: ResrvationPaymentService(
            Dio(),
          ),
        ),
      ),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Request For Rent'),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          widget.reservation.body.from,
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
                          widget.reservation.body.to,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.model,
                                      style: TextStyle(
                                          color: AppColors.darkGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "( ${widget.price.toString()} )",
                                      style: TextStyle(
                                          color: AppColors.green,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      widget.type,
                                      style: TextStyle(
                                          color: AppColors.darkGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '  |  ',
                                      style: TextStyle(
                                          color: AppColors.darkGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      widget.size.toString(),
                                      style: TextStyle(
                                          color: AppColors.darkGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  widget.note,
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
                                  "https://${widget.photoPath}",
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return const Icon(
                                        Icons.image_not_supported_rounded);
                                  },
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Charge",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkGrey,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${NumberFormat('#,###').format(widget.reservation.body.price)} S.P",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Enter your wallet password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkGrey,
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: password,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  obscureText: passwordConfirmVisible,
                  decoration: InputDecoration(
                    hintText: 'Wallet Password',
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
                const SizedBox(height: 29),
                SizedBox(
                  height: 56,
                  width: 340,
                  child: BlocConsumer<ReservationPaymentBloc,
                      ReservationPaymentState>(
                    listener: (context, state) {
                      if (state is SuccessReservationPayment) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThankYou()),
                        );
                      } else if (state is FaildReservationPayment) {
                        return errorMessage(
                            context, "Bad Request", [state.badRequest.message]);
                      }
                    },
                    builder: (context, state) {
                      return Button(
                        text: 'Confirm Ride',
                        onPressed: () {
                          context.read<ReservationPaymentBloc>().add(
                              PayReservation(
                                  reservationPayment: ReservationPaymentModel(
                                      reservationID: widget.reservation.body.id,
                                      walletPassword: password.text)));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
