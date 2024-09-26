// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_offers_bloc.dart';

@immutable
sealed class GetOffersState {}

final class GetOffersInitial extends GetOffersState {}

class SuccessGettingOffers extends GetOffersState {
  final GetAllOffers getAllOffers;
  SuccessGettingOffers({
    required this.getAllOffers,
  });
}

class BadStateOffer extends GetOffersState {
  final BadOfferRespond badOfferRespond;
  BadStateOffer({
    required this.badOfferRespond,
  });
}

class ExceptionStateOffer extends GetOffersState {
  final ExceptionOfferRespond exceptionOfferRespond;
  ExceptionStateOffer({
    required this.exceptionOfferRespond,
  });
}

class LoadingOffers extends GetOffersState {}
