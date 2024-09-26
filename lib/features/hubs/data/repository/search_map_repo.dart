// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rideshare_/features/hubs/data/model/search_map_model.dart';
import 'package:rideshare_/features/hubs/data/sources/remote/search_map_service.dart';

class SearchMapRepo {
  final SearchMapService searchMapService;
  SearchMapRepo({
    required this.searchMapService,
  });

  Future<GoogleMapsResponse> searchMapRepo(String query) async {
    try {
      var data = await searchMapService.search(query);
      GoogleMapsResponse locations = GoogleMapsResponse.fromMap(data.data);

      return locations;
    } catch (e) {
      return GoogleMapsResponse(results: []);
    }
  }
}
