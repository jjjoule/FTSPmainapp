import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:postgres/postgres_v3_experimental.dart';
import 'package:project/pages/main/explorer/selectroute.dart';

import 'dart:convert';
import 'explorer.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RouteResponse {
  Map<String, List<dynamic>> coordinates;
  Map<String, List<dynamic>> itinerary;
  Map<String, List<dynamic>> poiCategories;
  Map<String, List<dynamic>> leavetimepoi;

  dynamic vehicleMode;
  late Map<String, List<dynamic>> routing;

  RouteResponse(
      {required this.coordinates,
      required this.itinerary,
      required this.poiCategories,
      required this.vehicleMode,
      required this.routing,
      required this.leavetimepoi});

  factory RouteResponse.fromJson(Map<String, dynamic> json) {
    // coordinates Parsing
    Map<String, List<dynamic>> coordinates =
        Map<String, List<dynamic>>.from(json['Coords'] ?? {});
    debugPrint("Parsed Coordinates: $coordinates");

    // Parsing itinerary
    Map<String, List<dynamic>> itinerary =
        Map<String, List<dynamic>>.from(json['Itinerary'] ?? {});
    debugPrint("Parsed Itinerary: $itinerary");

    // Parsing poiCategories
    Map<String, List<dynamic>> poiCategories =
        Map<String, List<dynamic>>.from(json['POICategories'] ?? {});
    debugPrint("Parsed POICategories: $poiCategories");

    // Parsing vehicleMode
    dynamic vehicleMode = json['VehicleMode'];
    debugPrint("Parsed VehicleMode: $vehicleMode");

    // Parsing
    Map<String, List<dynamic>> leavetimepoi =
        Map<String, List<dynamic>>.from(json['LeaveTimePOI'] ?? {});
    debugPrint("Parsed LeaveTimePoI: $leavetimepoi");

    // routing Parsing
    Map<String, dynamic>? routingData = json['Routes'] as Map<String, dynamic>?;
    Map<String, List<dynamic>> routing = {};
    if (routingData != null) {
      routingData.forEach((key, value) {
        routing[key] = List.castFrom<dynamic, dynamic>(value);
      });
    }
    debugPrint("Parsed Routing: $routingData");

    return RouteResponse(
      coordinates: coordinates,
      itinerary: itinerary,
      poiCategories: poiCategories,
      vehicleMode: vehicleMode,
      routing: routing,
      leavetimepoi: leavetimepoi,
    );
  }
}

class ExplorerMapPage extends StatefulWidget {
  String Email;

  String UID;

  String routeindex;

  // String dateandTime;

  // String firstLocation;

  String secondLocation;

  TimeOfDay startTime;

  TimeOfDay endTime;

  int selectedIconIndex;

  int endDestinationChoice;

  int topK;

  int topN;

  double latStart;

  double longStart;

  double latEnd;

  double longEnd;

  ExplorerMapPage({
    Key? key,
    required this.Email,
    required this.UID,
    // required this.firstLocation,
    required this.secondLocation,
    required this.startTime,
    required this.endTime,
    required this.selectedIconIndex,
    required this.endDestinationChoice,
    required this.topK,
    required this.topN,
    required this.latStart,
    required this.latEnd,
    required this.longStart,
    required this.longEnd,
    required this.routeindex,
    // required this.dateandTime,
  }) : super(key: key);

  @override
  State<ExplorerMapPage> createState() => ExplorerMapPageState();
}

class ExplorerMapPageState extends State<ExplorerMapPage> {
  bool routesdrawn = false;
  bool loading = true;

  final TimeOfDay _timeOfDay1 = TimeOfDay.now();

  final Completer<GoogleMapController> _controller = Completer();

  GoogleMapController? _mapController;
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};
  Map<String, LatLng> poiCoordinates = {};
  RouteResponse? routeResponse;

  late LatLng startpoint = LatLng(widget.latStart, widget.longStart);
  late LatLng endpoint = LatLng(widget.latEnd, widget.longEnd);

  List<LatLng> polyLineCoordinates = [];

  String totalDistance = "";

  void makePostRequest() async {
    var url = 'http://10.0.2.2:7687/getrecommendation';

    int convertToSeconds(int hour, int min) {
      var totalSeconds = (hour * 3600) + (min * 60);
      return totalSeconds.toInt();
    }

    var timenow = DateTime.now().add((const Duration(hours: 8)));

    TimeOfDay endTime = widget.endTime;

    int hours = endTime.hour;
    int minutes = endTime.minute;

    var UserAvailHour = hours;
    // var UserAvailMin = userminutes;
    var UserAvailMin = minutes;

    debugPrint(
        'Hello the User Available Time is: $UserAvailHour hours and $UserAvailMin minutes');

    var jsondata = {
      'uid': widget.UID,
      'request_model_to_predict_ranked_pois_given_uid':
          "200", //debugging purposes

      'topk': widget.topK,

      'topn': widget.topN,

      'useravailtime': convertToSeconds(UserAvailHour, UserAvailMin),

      'vehiclemode': widget.selectedIconIndex,

      'mode': widget.endDestinationChoice,

      'userendpoi': widget.secondLocation,

      'latuser': widget.latStart.toString(),

      'longuser': widget.longStart.toString(),

      'allow_consecutive_foodpoi_in_itinerary': true,

      'StartDateTime': DateFormat('yyyy-MM-dd kk:mm:00')
          .format(DateTime.now().toUtc().add((const Duration(hours: 8)))),

      // 'StartDateTime': "2023-06-07 12:00:00"
    };

    // Duration difference = time.difference();

    // var jsondata = {
    //   'uid': "108938050734323740126",
    //   'request_model_to_predict_ranked_pois_given_uid': "200",
    //   'topk': "2",
    //   'topn': "2",
    //   'useravailtime': convertToSeconds(UserAvailHour, UserAvailMin),
    //   'vehiclemode': 1,
    //   'mode': 2,
    //   // 'userendpoi': "lower seletar reservoir",
    //   'userendpoi': "Marina Bay Sands Singapore",
    //   'latuser': "1.2931",
    //   'longuser': "103.8520",
    //   'allow_consecutive_foodpoi_in_itinerary': true,
    //   // 'StartDateTime': DateTime.now().toIso8601String(),
    //   'StartDateTime': "2023-06-07 20:00:00"
    // };

    var body = jsonEncode(jsondata);

    var headers = {'Content-Type': 'application/json'};

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      // Request was successful
      debugPrint('POST request successful explorermap');
      printJsonInChunks(response.body);

      // setState(() {
      //   routeResponse = RouteResponse.fromJson(json.decode(response.body));
      //   drawRoute(routeResponse!);
      // });
      routeResponse = RouteResponse.fromJson(json.decode(response.body));

      drawRoute(routeResponse!);
    } else {
      // Request failed
      debugPrint('POST request failed with status code ${response.statusCode}');
    }
  }

  void printJsonInChunks(String jsonString) {
    const int chunkSize = 1000;
    for (var i = 0; i < jsonString.length; i += chunkSize) {
      var end = (i + chunkSize < jsonString.length)
          ? i + chunkSize
          : jsonString.length;
      print(jsonString.substring(i, end));
    }
  }

  void drawRoute(RouteResponse routeResponse) async {
    List<dynamic>? routes = routeResponse.routing[widget.routeindex];

    // Check if routes is not null and is not empty
    if (routes != null && routes.isNotEmpty) {
      // Loop through the parsed routingdata and find 'route_geometry'inside the response
      for (var i = 0; i < routes.length; i++) {
        String? encodedPolyline = routes[i]['route_geometry'];

        List<LatLng> _decodePolyline(String? encodedPolyline) {
          List<LatLng> decodedPolyline = [];

          if (encodedPolyline != null && encodedPolyline.isNotEmpty) {
            List<PointLatLng> points =
                PolylinePoints().decodePolyline(encodedPolyline);
            decodedPolyline = points
                .map((point) => LatLng(point.latitude, point.longitude))
                .toList();
          } else {
            debugPrint('Encoded polyline is null or empty.');
          }
          debugPrint('Decoded Polyline: $decodedPolyline');

          return decodedPolyline;
        }

        if (encodedPolyline != null && encodedPolyline.isNotEmpty) {
          // Create the polylines from the route geometry
          Polyline polyline = Polyline(
            polylineId: PolylineId('route$i'),
            color: Colors.redAccent,
            points: _decodePolyline(encodedPolyline),
            width: 3,
          );

          // Create the polyline
          Set<Polyline> polylines = {polyline};

          _polylines.addAll(polylines); // Add all the polylines to the set
        } else {
          debugPrint('Unable to Display Polyline as it is null or empty.');
        }
      }

      // // Draw markers for POIs
      // List<dynamic> poiNames = routeResponse.itinerary['0']!;
      // List<dynamic> poiData = routeResponse.coordinates['0']!;

      if (widget.endDestinationChoice == 3) {
        // Draw markers for POIs
        List<dynamic> poiNames = routeResponse.itinerary[widget.routeindex]!;
        List<dynamic> poiData = routeResponse.coordinates[widget.routeindex]!;
        int lastIndex = poiData.length - 1;

        for (int i = 1; i < poiNames.length - 1; i++) {
          if (poiNames[i] is String &&
              i < poiData.length &&
              poiData[i] is List<dynamic>) {
            String poiName = poiNames[i];
            List<dynamic> poiCoordinates = poiData[i];
            double latitude = poiCoordinates[0];
            double longitude = poiCoordinates[1];
            LatLng poiLatLng = LatLng(latitude, longitude);

            debugPrint('POI Name: $poiName, POI LatLng: $poiLatLng');
            if (poiLatLng == startpoint) {
              //Prevent overlap of POI Marker and Starting Marker when user chooses Return to Start point
              debugPrint('Starting point mode');
              // Create marker for starting point
              _markers.add(Marker(
                markerId: const MarkerId('Start point'),
                position: startpoint,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueMagenta),
                infoWindow: const InfoWindow(title: 'Starting/End point'),
              ));
            } else {
              //create marker for the POI names
              setState(() {
                _markers.add(
                  Marker(
                    markerId: MarkerId(poiName),
                    position: poiLatLng,
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueCyan,
                    ),
                    infoWindow: InfoWindow(title: poiName),
                  ),
                );
              });

              _markers.add(Marker(
                markerId: const MarkerId('Start point'),
                position: startpoint,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
                infoWindow: const InfoWindow(title: 'Starting point'),
              ));
            }
          }
        }
        if (lastIndex >= 0) {
          List<dynamic> lastPoiCoordinates = poiData[lastIndex];
          String endLocationName = poiNames[lastIndex];

          debugPrint(
              'Last POI Name: $endLocationName, POI LatLng: $lastPoiCoordinates'); // Print the name of the last POI

          _markers.add(Marker(
            markerId: const MarkerId('End point'),
            position: LatLng(lastPoiCoordinates[0], lastPoiCoordinates[1]),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
            infoWindow: InfoWindow(title: '$endLocationName (End Destination)'),
          ));
        }
      } else {
        // Draw markers for POIs
        List<dynamic> poiNames = routeResponse.itinerary[widget.routeindex]!;
        List<dynamic> poiData = routeResponse.coordinates[widget.routeindex]!;

        for (int i = 1; i < poiNames.length; i++) {
          if (poiNames[i] is String &&
              i < poiData.length &&
              poiData[i] is List<dynamic>) {
            String poiName = poiNames[i];
            List<dynamic> poiCoordinates = poiData[i];
            double latitude = poiCoordinates[0];
            double longitude = poiCoordinates[1];
            LatLng poiLatLng = LatLng(latitude, longitude);

            debugPrint('POI Name: $poiName, POI LatLng: $poiLatLng');
            if (poiLatLng == startpoint) {
              //Prevent overlap of POI Marker and Starting Marker when user chooses Return to Start point
              debugPrint('Starting point mode');
              // Create marker for starting point
              _markers.add(Marker(
                markerId: const MarkerId('Start point'),
                position: startpoint,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueMagenta),
                infoWindow: const InfoWindow(title: 'Starting/End point'),
              ));
            } else {
              //create marker for the POI names
              setState(() {
                _markers.add(
                  Marker(
                    markerId: MarkerId(poiName),
                    position: poiLatLng,
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueCyan,
                    ),
                    infoWindow: InfoWindow(title: poiName),
                  ),
                );
              });

              _markers.add(Marker(
                markerId: const MarkerId('Start point'),
                position: startpoint,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
                infoWindow: const InfoWindow(title: 'Starting point'),
              ));
            }
          }
        }
      }
    } else {
      debugPrint('No routes found in the response.');
    }
  }

  @override
  void initState() {
    super.initState();
    makePostRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SelectRoutePage(
                    Email: widget.Email,
                    UID: widget.UID,
                    // firstLocation: widget.firstLocation,
                    secondLocation: widget.secondLocation,
                    startTime: widget.startTime,
                    endTime: widget.endTime,
                    selectedIconIndex: widget.selectedIconIndex,
                    endDestinationChoice: widget.endDestinationChoice,
                    topK: widget.topK,
                    topN: widget.topN,
                    latStart: widget.latStart,
                    latEnd: widget.latEnd,
                    longStart: widget.longStart,
                    longEnd: widget.longEnd,
                    routeindex: widget.routeindex,
                    // dateandTime: widget.dateandTime,
                  );
                },
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 95.0),
          child: Row(
            children: [
              const Text(
                "Route",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 108),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                          ),
                          content: SizedBox(
                            height: 240,
                            width: 240,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 65.0),
                                      child: Text(
                                        'Instructions',
                                        style: TextStyle(
                                            fontSize: 20,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 19),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  '1. The map shows your starting ',
                                  style: TextStyle(fontSize: 17),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 167),
                                  child: Text('point'),
                                ),
                                const Text(''),
                                const Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Text(
                                    '2. To increase map size, click',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text('on the "+" icon at the bottom'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 68),
                                  child: Text('right of the screen.'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.info_outline_rounded),
                  iconSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: startpoint,
          zoom: 14.0,
        ),
        polylines: _polylines,
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                content: SizedBox(
                  height: 240,
                  width: 240,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 170.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 35,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          'How would you rate your',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          'journey?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            Flushbar(
                              icon: const Icon(
                                Icons.message,
                                size: 32,
                                color: Colors.white,
                              ),
                              shouldIconPulse: false,
                              padding: const EdgeInsets.all(24),
                              title: 'Success Message',
                              message: 'Rating has been submitted. Thank you!!',
                              flushbarPosition: FlushbarPosition.TOP,
                              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              duration: const Duration(seconds: 3),
                              barBlur: 20,
                              backgroundColor:
                                  Colors.green.shade700.withOpacity(0.9),
                            ).show(context);
                          });
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ExplorerPage(
                                  Email: widget.Email,
                                  UID: widget.UID,
                                  // firstLocation: 'Search destination',
                                  secondLocation: 'Search destination',
                                  startTime: TimeOfDay.now(),
                                  endTime: TimeOfDay.now(),
                                  selectedIconIndex: -1,
                                  endDestinationChoice: 0,
                                  topK: 2,
                                  topN: 2,
                                  latStart: 0,
                                  latEnd: 0,
                                  longStart: 0,
                                  longEnd: 0,
                                  // dateandTime: " ",
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade600,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(230, 50),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ))),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: const Text('End Journey'),
        icon: const Icon(Icons.map),
        backgroundColor: Colors.red.shade600,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
