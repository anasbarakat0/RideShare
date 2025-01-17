// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/model/Settings/change_password_respond.dart';
import 'package:rideshare_/model/offer/get_offer_model.dart';
import 'package:rideshare_/service/offer/get_offers_service.dart';

class GetOffersRepo {
  final GetOffersService getOffersService;
  GetOffersRepo({
    required this.getOffersService,
  });

  Future<GetOfferModel> getOffersRepo() async {
    try {
      var data = await getOffersService.getOffersService();
      return GetAllOffers.fromMap(data.data);
    } on BadRequest catch (e) {
      return BadOfferRespond.fromMap(e.toMap());
    } on DioException catch (e) {
      return ExceptionOfferRespond(message: e.response!.data);
    }
  }
}
