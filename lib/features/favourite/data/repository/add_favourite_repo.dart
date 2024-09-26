// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:rideshare_/features/settings/change_password/data/model/change_password_respond.dart';
import 'package:rideshare_/features/favourite/data/model/favourite_model.dart';
import 'package:rideshare_/features/favourite/data/sources/remote/add_favourite_service.dart';

class AddFavouriteRepo {
  final AddFavouriteService addFavouriteService;
  AddFavouriteRepo({
    required this.addFavouriteService,
  });

  Future<FavouriteModel> addFavouriteRepo(int id) async {
    try {
      var data = await addFavouriteService.addFavouriteService(id);

      return FavouriteRespond.fromMap(data.data);
    } on BadRequest catch (e) {
      return BadFavoriteRespond.fromMap(e.toMap());
    } on DioException catch (e) {
      return ExceptionFavoriteRespond(message: e.response!.data);
    }
  }
}
