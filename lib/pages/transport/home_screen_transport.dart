import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rideshare_/bloc/hubs/get_all_hubs_bloc.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/model/hubs/get_all_hubs_response_model.dart';
import 'package:rideshare_/model/hubs/search_map_model.dart';
import 'package:rideshare_/pages/notifecation.dart';
import 'package:rideshare_/pages/transport/select_transport.dart';
import 'package:rideshare_/repo/hubs/get_all_hubs_repo.dart';
import 'package:rideshare_/repo/hubs/search_map_repo.dart';
import 'package:rideshare_/service/hubs/get_all_hubs_service.dart';
import 'package:rideshare_/service/hubs/search_map_service.dart';
import 'package:rideshare_/text_button.dart';
import 'package:rideshare_/widgets.dart';

class HomeScreenTransport extends StatefulWidget {
  const HomeScreenTransport({super.key});

  @override
  State<HomeScreenTransport> createState() => _HomeScreenTransportState();
}

class _HomeScreenTransportState extends State<HomeScreenTransport> {
  TextEditingController search = TextEditingController();
  GoogleMapsResponse locations = GoogleMapsResponse(results: []);
  GoogleMapController? _controller;
  bool selectText = true;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.51020000, 36.29128000),
    zoom: 14.4746,
  );

  Position? _currentPosition;
  final Set<Marker> _markers = {};
  final Set<Circle> _circles = {};
  BitmapDescriptor? markerIcon;

  @override
  void initState() {
    _setCustomMarkerIcons();
    _getCurrentLocation();
    super.initState();
  }

  Future<void> _setCustomMarkerIcons() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(40, 40)),
      'assets/map.png',
    );
  }

  Future<void> _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition();

    setState(
      () {
        _markers.add(
          Marker(
            markerId: const MarkerId('currentLocation'),
            position:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            infoWindow: const InfoWindow(title: 'My Location'),
            icon: markerIcon ?? BitmapDescriptor.defaultMarkerWithHue(1),
          ),
        );
        _circles.add(
          Circle(
            circleId: const CircleId('0'),
            center:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            radius: 25,
            strokeColor: AppColors.greenIcon.withOpacity(0),
            fillColor: AppColors.greenIcon.withOpacity(0.1),
          ),
        );
        _circles.add(
          Circle(
            circleId: const CircleId('1'),
            center:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            radius: 20,
            strokeColor: AppColors.greenIcon.withOpacity(0),
            fillColor: AppColors.greenIcon.withOpacity(0.15),
          ),
        );
        _circles.add(
          Circle(
            circleId: const CircleId('2'),
            center:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            radius: 12,
            strokeColor: AppColors.greenIcon.withOpacity(0),
            fillColor: AppColors.greenIcon.withOpacity(0.25),
          ),
        );
        _circles.add(
          Circle(
            circleId: const CircleId('3'),
            center:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            radius: 5,
            strokeColor: AppColors.greenIcon.withOpacity(0),
            fillColor: AppColors.greenIcon.withOpacity(0.5),
          ),
        );
      },
    );

    _controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(_currentPosition!.latitude - 0.0002,
                _currentPosition!.longitude),
            zoom: 19),
      ),
    );
  }

  String dropDownValue1 = "From";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          myLocationEnabled: true,
          markers: _markers,
          circles: _circles,
          onLongPress: (argument) {
            setState(() {
              _markers.add(
                Marker(
                  markerId: const MarkerId('setLocation'),
                  position: argument,
                  infoWindow: const InfoWindow(title: 'set Location'),
                  icon: markerIcon ?? BitmapDescriptor.defaultMarkerWithHue(1),
                ),
              );
              _circles.add(
                Circle(
                  circleId: const CircleId('0'),
                  center: argument,
                  radius: 25,
                  strokeColor: AppColors.greenIcon.withOpacity(0),
                  fillColor: AppColors.greenIcon.withOpacity(0.1),
                ),
              );
              _circles.add(
                Circle(
                  circleId: const CircleId('1'),
                  center: argument,
                  radius: 20,
                  strokeColor: AppColors.greenIcon.withOpacity(0),
                  fillColor: AppColors.greenIcon.withOpacity(0.15),
                ),
              );
              _circles.add(
                Circle(
                  circleId: const CircleId('2'),
                  center: argument,
                  radius: 12,
                  strokeColor: AppColors.greenIcon.withOpacity(0),
                  fillColor: AppColors.greenIcon.withOpacity(0.25),
                ),
              );
              _circles.add(
                Circle(
                  circleId: const CircleId('3'),
                  center: argument,
                  radius: 5,
                  strokeColor: AppColors.greenIcon.withOpacity(0),
                  fillColor: AppColors.greenIcon.withOpacity(0.5),
                ),
              );
            });
          },
          onTap: (argument) {
            setState(() {
              _markers.clear();
              _circles.clear();
            });
          },
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 155),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Builder(builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Icons.menu_outlined),
                      );
                    }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotifecationPage()));
                      },
                      icon: const Icon(Icons.notifications_outlined),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 54,
                        width: 172,
                        child: Button(
                          text: 'Rental',
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  return BlocProvider(
                                    create: (context) => GetAllHubsBloc(
                                        GetAllHubsRepo(
                                            getAllHubsService:
                                                GetAllHubsService(Dio()))),
                                    child: Builder(builder: (context) {
                                      context.read<GetAllHubsBloc>().add(
                                          GetAllHubs(
                                              lon:
                                                  _currentPosition != null
                                                      ? _currentPosition!
                                                          .longitude
                                                      : 36.29128000,
                                              lat: _currentPosition != null
                                                  ? _currentPosition!.latitude
                                                  : 33.51020000));
                                      bool seeAll = false;
                                      return BlocConsumer<GetAllHubsBloc,
                                          GetAllHubsState>(
                                        listener: (context, state) {},
                                        builder: (context, state) {
                                          if (state is GetAllHubsInitial) {
                                            return const Center(
                                              child: Text('wait few seconds'),
                                            );
                                          } else if (state
                                              is SuccessGettingAllHubs) {
                                            int? fromId;
                                            int? toId;
                                            String? fromName;
                                            String? toName;
                                            return SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 21,
                                                            bottom: 28),
                                                    child: Container(
                                                      height: 5,
                                                      width: 134,
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromRGBO(
                                                            20, 20, 20, 0.4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Select address',
                                                    style: TextStyle(
                                                      color: AppColors.darkGrey,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  const Divider(),
                                                  const SizedBox(height: 16),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16),
                                                    child: DropdownMenu(
                                                      leadingIcon: const Icon(Icons
                                                          .location_searching),
                                                      label: const Text("From"),
                                                      width: 362,
                                                      enableFilter: true,
                                                      dropdownMenuEntries:
                                                          state.hubs.body.map<
                                                              DropdownMenuEntry<
                                                                  int>>((hub) {
                                                        return DropdownMenuEntry(
                                                          value: hub.id,
                                                          label: hub.name,
                                                        );
                                                      }).toList(),
                                                      onSelected: (id) {
                                                        if (id != null) {
                                                          setState(() {
                                                            fromId = id;
                                                            Body hub = state
                                                                .hubs.body
                                                                .firstWhere(
                                                                    (b) =>
                                                                        b.id ==
                                                                        id);
                                                            fromName = hub.name;
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16),
                                                    child: DropdownMenu(
                                                      leadingIcon: const Icon(Icons
                                                          .location_on_outlined),
                                                      label: const Text("To"),
                                                      width: 362,
                                                      enableFilter: true,
                                                      dropdownMenuEntries:
                                                          state.hubs.body.map<
                                                              DropdownMenuEntry<
                                                                  int>>((hub) {
                                                        return DropdownMenuEntry(
                                                          value: hub.id,
                                                          label: hub.name,
                                                        );
                                                      }).toList(),
                                                      onSelected: (id) {
                                                        if (id != null) {
                                                          setState(() {
                                                            toId = id;

                                                            toName = state
                                                                .hubs.body
                                                                .firstWhere(
                                                                    (b) =>
                                                                        b.id ==
                                                                        id)
                                                                .name;
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  const Divider(),
                                                  const SizedBox(height: 14),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 17),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Recent places',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .darkGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                if (seeAll) {
                                                                  seeAll =
                                                                      false;
                                                                } else {
                                                                  seeAll = true;
                                                                }
                                                              });
                                                            },
                                                            child: Text(
                                                              seeAll
                                                                  ? "Hide"
                                                                  : "See All",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  if (seeAll)
                                                    SizedBox(
                                                      height: 64 *
                                                          state.hubs.body.length
                                                              .toDouble(),
                                                      child: ListView.builder(
                                                        itemCount: state
                                                            .hubs.body.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return ListTile(
                                                            title: Text(
                                                              state
                                                                  .hubs
                                                                  .body[index]
                                                                  .name,
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .darkGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            subtitle: Text(
                                                              state
                                                                  .hubs
                                                                  .body[index]
                                                                  .description,
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            leading: const Icon(
                                                                Icons
                                                                    .location_on),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 30),
                                                    child: SizedBox(
                                                      width: 320,
                                                      height: 54,
                                                      child: Button(
                                                        text:
                                                            "Confirm Location",
                                                        onPressed: () {
                                                          if (fromId != null &&
                                                              toId != null &&
                                                              fromName !=
                                                                  null &&
                                                              toName != null) {
                                                            Navigator.of(context).push(MaterialPageRoute(
                                                                builder: (context) => SelectTransport(
                                                                    fromId:
                                                                        fromId!,
                                                                    toId: toId!,
                                                                    fromName:
                                                                        fromName!,
                                                                    toName:
                                                                        toName!)));
                                                          } else {
                                                            errorMessage(
                                                              context,
                                                              "Worning",
                                                              [
                                                                "Select the locations"
                                                              ],
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else if (state is EmptyHubs) {
                                            return Center(
                                              child: Text(state.message),
                                            );
                                          } else if (state
                                              is ExceptionGettingAllHubs) {
                                            return Center(
                                              child: Text(
                                                state.message,
                                              ),
                                            );
                                          } else {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      );
                                    }),
                                  );
                                });
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: IconButton(
                          onPressed: _getCurrentLocation,
                          icon: const Icon(Icons.location_searching_rounded),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 141,
                    width: 364,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 54,
                            child: TextField(
                              controller: search,
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.lightGreen,
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: search.text.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            search.clear();
                                            locations.results.clear();
                                          });
                                        },
                                      )
                                    : null,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.greenIcon,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: AppColors.greenIcon,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: 'Where would you go?',
                                hintStyle: TextStyle(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (search) async {
                                var data = await SearchMapRepo(
                                        searchMapService:
                                            SearchMapService(Dio()))
                                    .searchMapRepo(search);
                                setState(() {
                                  locations = data;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 48,
                                width: 336,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGreen,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.greenIcon, width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectText = true;
                                        });
                                      },
                                      child: SizedBox(
                                        width: 85,
                                        child: Text(
                                          'Transport',
                                          style: TextStyle(
                                            color: AppColors.darkGrey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectText = false;
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 85,
                                        child: Text(
                                          'Delivery',
                                          style: TextStyle(
                                            color: AppColors.darkGrey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: selectText ? 0 : null,
                                right: selectText ? null : 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 48,
                                  width: 168,
                                  decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    selectText ? 'Transport' : 'Delivery',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (locations.results.isNotEmpty)
          Column(
            children: [
              const SizedBox(
                height: 125,
              ),
              SizedBox(
                height: 430,
                child: ListView.builder(
                  reverse: true,
                  itemCount: locations.results.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.greenIcon,
                            width: 1,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            locations.results[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkGrey,
                            ),
                          ),
                          subtitle: Text(
                            locations.results[index].formatted_address,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.greenIcon,
                            ),
                          ),
                          onTap: () {
                            search.clear();
                            _controller?.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                    target: LatLng(
                                        locations.results[index].geometry
                                                .location.lat -
                                            0.0002,
                                        locations.results[index].geometry
                                            .location.lng),
                                    zoom: 17.5),
                              ),
                            );
                            setState(() {
                              _markers.add(
                                Marker(
                                  markerId: MarkerId(
                                      locations.results[index].place_id),
                                  position: LatLng(
                                      locations
                                          .results[index].geometry.location.lat,
                                      locations.results[index].geometry.location
                                          .lng),
                                  infoWindow: InfoWindow(
                                      title: locations.results[index].name),
                                  icon: markerIcon ??
                                      BitmapDescriptor.defaultMarkerWithHue(1),
                                ),
                              );
                              _circles.add(
                                Circle(
                                  circleId: CircleId(
                                      "${locations.results[index].place_id}(0)"),
                                  center: LatLng(
                                      locations
                                          .results[index].geometry.location.lat,
                                      locations.results[index].geometry.location
                                          .lng),
                                  radius: 25,
                                  strokeColor:
                                      AppColors.greenIcon.withOpacity(0),
                                  fillColor:
                                      AppColors.greenIcon.withOpacity(0.1),
                                ),
                              );
                              _circles.add(
                                Circle(
                                  circleId: CircleId(
                                      '${locations.results[index].place_id}(1)'),
                                  center: LatLng(
                                      locations
                                          .results[index].geometry.location.lat,
                                      locations.results[index].geometry.location
                                          .lng),
                                  radius: 20,
                                  strokeColor:
                                      AppColors.greenIcon.withOpacity(0),
                                  fillColor:
                                      AppColors.greenIcon.withOpacity(0.15),
                                ),
                              );
                              _circles.add(
                                Circle(
                                  circleId: CircleId(
                                      '${locations.results[index].place_id}(2)'),
                                  center: LatLng(
                                      locations
                                          .results[index].geometry.location.lat,
                                      locations.results[index].geometry.location
                                          .lng),
                                  radius: 12,
                                  strokeColor:
                                      AppColors.greenIcon.withOpacity(0),
                                  fillColor:
                                      AppColors.greenIcon.withOpacity(0.25),
                                ),
                              );
                              _circles.add(
                                Circle(
                                  circleId: CircleId(
                                      '${locations.results[index].place_id}(3)'),
                                  center: LatLng(
                                      locations
                                          .results[index].geometry.location.lat,
                                      locations.results[index].geometry.location
                                          .lng),
                                  radius: 5,
                                  strokeColor:
                                      AppColors.greenIcon.withOpacity(0),
                                  fillColor:
                                      AppColors.greenIcon.withOpacity(0.5),
                                ),
                              );
                            });
                            locations.results.clear();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
      ],
    );
  }
}
