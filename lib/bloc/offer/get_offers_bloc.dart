// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rideshare_/model/offer/get_offer_model.dart';
import 'package:rideshare_/repo/offer/get_offers_repo.dart';

part 'get_offers_event.dart';
part 'get_offers_state.dart';

class GetOffersBloc extends Bloc<GetOffersEvent, GetOffersState> {
  final GetOffersRepo getOffersRepo;
  GetOffersBloc(
    this.getOffersRepo,
  ) : super(GetOffersInitial()) {
    on<GetOffers>((event, emit) async {
      var data = await getOffersRepo.getOffersRepo();
      if (data is GetAllOffers) {
        emit(SuccessGettingOffers(getAllOffers: data));
      } else if (data is BadOfferRespond) {
        emit(BadStateOffer(badOfferRespond: data));
      } else if (data is ExceptionOfferRespond) {
        emit(ExceptionStateOffer(exceptionOfferRespond: data));
      } else {
        emit(LoadingOffers());
      }
    });
  }
}
