// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rideshare_/core/error/exception.dart';
import 'package:rideshare_/features/reservations/data/model/new_reservation_model.dart';
import 'package:rideshare_/features/reservations/data/sources/remote/new_reservation_service.dart';

class NewReservationRepo {
  final NewReservationService newReservationService;
  NewReservationRepo({
    required this.newReservationService,
  });

  Future<Reservation> newReservationRepo(
      NewReservationModel reservation) async {
    try {
      var data = await newReservationService.newReservationService(reservation);
      ReservationSuccessRespond reservationReq =
          ReservationSuccessRespond.fromMap(data.data);
      return reservationReq;
    } on BicycleNotFound catch (e) {
      return e.reservationBadRequest;
    } on SourceHubNotFound catch (e) {
      return e.reservationBadRequest;
    } on TargetHubNotFound catch (e) {
      return e.reservationBadRequest;
    } on BicycleNotFoundInSource catch (e) {
      return e.reservationBadRequest;
    } on BicycleReserved catch (e) {
      return e.reservationBadRequest;
    } catch (e) {
      rethrow;
    }
  }
}
