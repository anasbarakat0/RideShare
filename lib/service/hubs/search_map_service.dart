import 'package:dio/dio.dart';
import 'package:rideshare_/const.dart';
import 'package:rideshare_/service/service.dart';

class SearchMapService extends Service {
  SearchMapService(super.dio);
  Future<Response> search(String query) async {
    try {
      String url =
          "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$googleApiKey";
      response = await dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
