//import 'package:project/pages/main/explorer/searchlocation1.dart';
//import 'package:project/pages/main/explorer/currentlocation.dart';
//import 'package:project/pages/main/explorer/explorermap.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/main/explorer/selectroute.dart';
import 'package:project/pages/main/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'choiceForEnd.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

const List<String> NoOfPOIs = <String>['2', '3', '4', '5', '6'];
const List<String> NoofItinerary = <String>['2', '3', '4', '5'];

class ExplorerPage extends StatefulWidget {
  String Email;
  String UID;
  // String firstLocation;
  String secondLocation;
  // String dateandTime;
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

  ExplorerPage({
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
    // required this.dateandTime,
  }) : super(key: key);

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class TimeSelection {
  final int hours;
  final int minutes;

  TimeSelection(this.hours, this.minutes);
}

class _ExplorerPageState extends State<ExplorerPage> {
  Position? _currentLocation;
  String location = "";

  double latStart = 0;
  double longStart = 0;

  void currentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      setState(() {
        widget.latStart = position.latitude;
        widget.longStart = position.longitude;

        location =
            "${place.street} , ${place.name} , ${place.country} ${place.postalCode}";
      });
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    if (!serviceEnabled) {
      return Future.error('Location Services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permission is denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location Permission are denied permanently.');
    }

    return await Geolocator.getCurrentPosition();
  }

  int pageIndex = 0;
  TimeOfDay _timeOfDay1 = TimeOfDay.now();
  String dropdownValueNoOfPOIs = NoOfPOIs.first;
  String dropdownValueNoOfItinerary = NoofItinerary.first;
  DateTime _endTime = DateTime.now();

  String formatTimeDifference(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    return '$hours hours and $minutes minutes';
  }

  Future<void> _selectDateTime() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_endTime),
    );

    if (selectedTime != null) {
      setState(() {
        _timeOfDay1 = selectedTime;
        widget.startTime = _timeOfDay1;
      });
    }

    if (selectedTime != null) {
      final selectedDateTime = await showDatePicker(
        context: context,
        initialDate: _endTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2024),
      );

      if (selectedDateTime != null) {
        setState(() {
          _endTime = DateTime(
            selectedDateTime.year,
            selectedDateTime.month,
            selectedDateTime.day,
            selectedTime.hour,
            selectedTime.minute,
          );
        });
      }
    }
  }

  @override
  void initState() {
    main();
    super.initState();
    currentLocation();
    debugPrint("In explorer.dart (lib\\pages\\main\\explorer.dart)");
  }

  void makePostRequest() async {
    var url = 'http://10.0.2.2:7687/getrecommendation';

    int convertToSeconds(int hour, int min) {
      var totalSeconds = (hour * 3600) + (min * 60);
      return totalSeconds.toInt();
    }

    var UserAvailHour = 0;
    var UserAvailMin = 0;

    var jsondata = {
      'uid': "108938050734323740126",
      'request_model_to_predict_ranked_pois_given_uid': "200",
      'topk': "2",
      'topn': "2",
      'useravailtime': convertToSeconds(UserAvailHour, UserAvailMin),
      'vehiclemode': "2",
      'mode': "1",
      // 'userendpoi': "lower seletar reservoir",
      'userendpoi': "Jem",
      'latuser': "1.2931",
      'longuser': "103.8520",
      'allow_consecutive_foodpoi_in_itinerary': true,
      // 'StartDateTime': DateTime.now().toIso8601String(),
      'StartDateTime': "2023-06-07 12:00:00"
    };

    var body = jsonEncode(jsondata);

    var headers = {'Content-Type': 'application/json'};

    // Chunk of code below keeps causing timeout and was therefore removed
    //var response = await http.post(Uri.parse(url), headers: headers, body: body);
    // if (response.statusCode == 200) {
    //   debugPrint('POST request successful explorer');
    //   debugPrint('Response body: ${response.body}');
    // } else {
    //   debugPrint('POST request failed with status code ${response.statusCode}');
    // }
  }

  void main() {
    makePostRequest();
  }

  int nowSec = 0;
  int endSec = 0;
  int previousSec = 0;
  int diffSec = 0;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final difference = _endTime.difference(DateTime.now());

    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);

    final timeOfDayDifference = TimeOfDay(hour: hours, minute: minutes);

    setState(() {
      widget.endTime = timeOfDayDifference;
    });

    return Scaffold(
      // backgroundColor: const Color(0xffC4DFCB),
      // body: pages[pageIndex],
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 15, right: 30),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 1,
                        ),
                        child: Column(
                          children: const [
                            Text(
                              '   AI Powered Planner                     ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                // color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(width: 35),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ProfilePage(
                                  Email: widget.Email,
                                  UID: widget.UID,
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(50, 60),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                        ),
                      ),
                    ],
                  ),
                ),

                ///////////////
                // Transport //
                ///////////////
                const Padding(
                  padding: EdgeInsets.only(right: 250, top: 20, bottom: 20),
                  child: Text(
                    'Transport',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 25, left: 25, bottom: 10),
                      child: SizedBox(
                        height: 60,
                        width: 342,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.selectedIconIndex = 1;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: widget.selectedIconIndex == 1
                                        ? Colors.red
                                        : Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 17),
                                        ///////////////
                                        // Walk Icon //
                                        ///////////////
                                        child: widget.selectedIconIndex == 1
                                            ? const Icon(
                                                Icons.directions_walk,
                                                size: 25,
                                                color: Colors.white,
                                              )
                                            : const Icon(
                                                Icons.directions_walk,
                                                size: 25,
                                                color: Colors.black,
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.selectedIconIndex = 2;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: widget.selectedIconIndex == 2
                                        ? Colors.red
                                        : Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18),
                                        ///////////////
                                        // Car Icon //
                                        ///////////////
                                        child: widget.selectedIconIndex == 2
                                            ? const Icon(
                                                Icons.directions_car,
                                                size: 25,
                                                color: Colors.white,
                                              )
                                            : const Icon(
                                                Icons.directions_car,
                                                size: 25,
                                                color: Colors.black,
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.selectedIconIndex = 3;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: widget.selectedIconIndex == 3
                                        ? Colors.red
                                        : Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18),
                                        ////////////////
                                        // Cycle Icon //
                                        ////////////////
                                        child: widget.selectedIconIndex == 3
                                            ? const Icon(
                                                Icons.directions_bike,
                                                size: 25,
                                                color: Colors.white,
                                              )
                                            : const Icon(
                                                Icons.directions_bike,
                                                size: 25,
                                                color: Colors.black,
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.selectedIconIndex = 4;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: widget.selectedIconIndex == 4
                                        ? Colors.red
                                        : Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          ///////////////////////////
                                          // Public Transport Icon //
                                          ///////////////////////////
                                          child: widget.selectedIconIndex == 4
                                              ? Image.asset(
                                                  'assets/public-transport.jpg',
                                                  height: 35,
                                                  width: 35,
                                                  color: Colors.white,
                                                )
                                              : Image.asset(
                                                  'assets/public-transport.jpg',
                                                  height: 35,
                                                  width: 35,
                                                  color: Colors.black,
                                                )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  /////////////////////////
                  // Recommendation Mode //
                  /////////////////////////
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 26.0),
                      child: Text(
                        'Recommendation Mode',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 20,
                  ),
                  child: Row(
                    ///////////////////////////////////
                    // Recommendation Mode Drop Down //
                    ///////////////////////////////////
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                ////////////////////////////////
                                // Go to End Destination Page //
                                ////////////////////////////////
                                return ChoiceForEndPage(
                                  Email: widget.Email,
                                  UID: widget.UID,
                                  // firstLocation: widget.firstLocation,
                                  secondLocation: widget.secondLocation,
                                  startTime: widget.startTime,
                                  endTime: widget.endTime,
                                  selectedIconIndex: widget.selectedIconIndex,
                                  endDestinationChoice:
                                      widget.endDestinationChoice,
                                  topK: widget.topK,
                                  topN: widget.topN,
                                  latStart: widget.latStart,
                                  latEnd: widget.latEnd,
                                  longStart: widget.longStart,
                                  longEnd: widget.longEnd,
                                  // dateandTime: widget.dateandTime,
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(352, 60),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            // Icon(
                            //   Icons.search,
                            //   color: Colors.grey.shade800,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: SizedBox(
                                height: 40,
                                width: 245,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 0, bottom: 10),
                                  child: Text(
                                    widget.secondLocation,
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //////////////////////////////////////////////////////////////////////////
                            // Down arrow button on right side of Recommendation Mode Drop down box //
                            //////////////////////////////////////////////////////////////////////////
                            // Padding(
                            //   padding: const EdgeInsets.only(),
                            //   child: IconButton(
                            //     onPressed: () {
                            //       setState(() {
                            //         widget.secondLocation = '';
                            //       });
                            //     },
                            //     icon: Icon(
                            //       Icons.arrow_drop_down,
                            //       color: Colors.grey.shade600,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: const [
                    /////////////////////////////////////////////
                    // Change Request ** Remove Number of POIs //
                    /////////////////////////////////////////////
                    // Padding(
                    //   padding: EdgeInsets.only(left: 25, top: 20),
                    //   child: Text(
                    //     'Number of POIs',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),

                    ///////////////////////////
                    // Itinerary to Generate //
                    ///////////////////////////
                    Padding(
                      padding: EdgeInsets.only(left: 26, top: 20),
                      child: Text(
                        'Itinerary to Generate',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    children: [
                      /////////////////////////////////////////////////////////
                      // Change Request ** Remove Number of POIs ** DropDown //
                      /////////////////////////////////////////////////////////

                      // Padding(
                      //   padding: const EdgeInsets.only(top: 15, left: 20),
                      //   child: Container(
                      //     height: 60,
                      //     width: 118,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.grey.withOpacity(0.5),
                      //           // spreadRadius: 1,
                      //           blurRadius: 1,
                      //           offset: const Offset(0, 3),
                      //         ),
                      //       ],
                      //       borderRadius: const BorderRadius.all(
                      //         Radius.circular(20),
                      //       ),
                      //     ),
                      //     child: Column(
                      //       children: [
                      //         Padding(
                      //           padding:
                      //               const EdgeInsets.only(top: 5, left: 17),
                      //           child: DropdownButton2(
                      //             iconStyleData: const IconStyleData(
                      //               icon: Padding(
                      //                 padding: EdgeInsets.only(left: 38),
                      //                 child: Icon(Icons.arrow_drop_down),
                      //               ),
                      //               iconSize: 30,
                      //             ),
                      //             dropdownStyleData: DropdownStyleData(
                      //               maxHeight: 200,
                      //               width: 100,
                      //               padding: null,
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(14),
                      //               ),
                      //               elevation: 8,
                      //               offset: const Offset(-20, 0),
                      //               scrollbarTheme: ScrollbarThemeData(
                      //                 radius: const Radius.circular(40),
                      //                 thickness: MaterialStateProperty.all(6),
                      //                 thumbVisibility:
                      //                     MaterialStateProperty.all(true),
                      //               ),
                      //             ),
                      //             underline: const SizedBox(),
                      //             value: widget.topK.toString(),
                      //             onChanged: (newValue) {
                      //               setState(() {
                      //                 dropdownValueNoOfPOIs = newValue!;
                      //                 widget.topK = int.parse(dropdownValueNoOfPOIs);
                      //               });
                      //             },
                      //             items: NoOfPOIs.map<DropdownMenuItem<String>>(
                      //                 (value) {
                      //               return DropdownMenuItem<String>(
                      //                 value: value,
                      //                 child: Text(value),
                      //               );
                      //             }).toList(),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 26),
                        child: Container(
                          height: 60,
                          width: 118,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 17),
                                child: DropdownButton2(
                                  iconStyleData: const IconStyleData(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 38),
                                      child: Icon(Icons.arrow_drop_down),
                                    ),
                                    iconSize: 30,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 100,
                                    padding: null,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    elevation: 8,
                                    offset: const Offset(-20, 0),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(40),
                                      thickness: MaterialStateProperty.all(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all(true),
                                    ),
                                  ),
                                  underline: const SizedBox(),
                                  value: widget.topN.toString(),
                                  onChanged: (newValue2) {
                                    setState(() {
                                      dropdownValueNoOfItinerary = newValue2!;
                                      widget.topN =
                                          int.parse(dropdownValueNoOfItinerary);
                                    });
                                  },
                                  items: NoOfPOIs.map<DropdownMenuItem<String>>(
                                      (value2) {
                                    return DropdownMenuItem<String>(
                                      value: value2,
                                      child: Text(value2),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 20),
                      child: Text(
                        'End Time',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: ElevatedButton(
                          onPressed: _selectDateTime,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(100, 60),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.grey.shade900,
                              ),
                              Text(
                                '${DateFormat('h:mm a').format(_endTime)}',
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      currentLocation();
                      _getCurrentLocation();

                      if (formKey.currentState!.validate()) {
                        nowSec = (widget.startTime.hour * 60 +
                                widget.startTime.minute) *
                            60;
                        endSec =
                            (widget.endTime.hour * 60 + widget.endTime.minute) *
                                60;
                        previousSec =
                            (_timeOfDay1.hour * 60 + _timeOfDay1.minute) * 60;
                        diffSec = endSec - nowSec;
                        debugPrint(
                            '{\n "UID" : "${widget.UID}"\n "TopK" : "${widget.topK}"\n "TopN" : "${widget.topN}"\n "Time in seconds" : "$diffSec" \n "VehicleMode" : "${widget.selectedIconIndex}"\n "Mode" : "${widget.endDestinationChoice}"\n "UserEndPoi" : "${widget.secondLocation}"\n "Latitude test" : "${widget.latStart}"\n "Longitude" : "${widget.longStart}"\n ');

                        debugPrint(location);

                        if (widget.secondLocation != 'Select mode' &&
                            (widget.selectedIconIndex == 1 ||
                                widget.selectedIconIndex == 2 ||
                                widget.selectedIconIndex == 3 ||
                                widget.selectedIconIndex == 4)) {
                          main();
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
                                  endDestinationChoice:
                                      widget.endDestinationChoice,
                                  topK: widget.topK,
                                  topN: widget.topN,
                                  latStart: widget.latStart,
                                  latEnd: widget.latEnd,
                                  longStart: widget.longStart,
                                  longEnd: widget.longEnd,
                                  routeindex: '0',
                                  // dateandTime: widget.dateandTime,
                                );
                              },
                            ),
                          );
                        } else {
                          if (widget.secondLocation == 'Select mode') {
                            showTopSnackBar(context,
                                error: 'Error',
                                message: 'Please choose a recommendation mode');
                          } else if (!(widget.selectedIconIndex == 1 ||
                              widget.selectedIconIndex == 2 ||
                              widget.selectedIconIndex == 3 ||
                              widget.selectedIconIndex == 4)) {
                            showTopSnackBar(context,
                                error: 'Error',
                                message: 'Please select a mode of transport');
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade600,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(360, 60),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Get Recommendations  ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showTopSnackBar(BuildContext context,
          {required String error, required String message}) =>
      Flushbar(
        icon: const Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        padding: const EdgeInsets.all(24),
        title: error,
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        backgroundColor: Colors.red.shade700.withOpacity(0.9),
      )..show(context);
}

class TravelInfo {
  final String name;
  final String email;

  TravelInfo(this.name, this.email);

  TravelInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
