import 'package:flutter/material.dart';
import 'package:project/pages/main/explorer/explorermap.dart';

import '../../../constants.dart';
import 'explorer.dart';
import 'package:intl/intl.dart';

class SelectRoutePage extends StatefulWidget {
  String Email;

  String UID;

  // String dateandTime;

  // String firstLocation;

  String secondLocation;

  String routeindex;

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

  SelectRoutePage({
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
  State<SelectRoutePage> createState() => _SelectRoutePageState();
}

class _SelectRoutePageState extends State<SelectRoutePage> {
  String routeindex = '';
  @override
  Widget build(BuildContext context) {
    TimeOfDay endTime = widget.endTime;

    int hours = endTime.hour;
    int minutes = endTime.minute;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: IconButton(
                      onPressed: () {
                        // print('numbner of topk: ${widget.topK}');
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ExplorerPage(
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
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 65),
                    child: Text(
                      "Select Your Route",
                      style: TextStyle(
                        color: textColorLightTheme,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                height: 170,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(27),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Icon(
                              Icons.location_on,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 50,
                            width: 3,
                            color: Colors.grey.shade400,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Icons.location_on,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 197, top: 25),
                          child: Text(
                            'From',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 15),
                              child: SizedBox(
                                height: 40,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 9.0),
                                  child: Text(
                                    "Current Location",
                                    // widget.secondLocation,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 3,
                              color: Colors.grey.shade300,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text(
                                DateFormat('h:mm a').format(DateTime.now()
                                    .toUtc()
                                    .add((const Duration(hours: 8)))),
                                // DateFormat('kk:mm a').format(DateTime.now()),
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 3),
                          child: Container(
                            height: 3,
                            width: 240,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 213, top: 10),
                              child: Text(
                                'To',
                                style: TextStyle(
                                  color: Colors.red.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 15),
                                  child: SizedBox(
                                    height: 40,
                                    width: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 9.0),
                                      child: Text(
                                        widget.secondLocation,
                                        style: TextStyle(
                                          color: Colors.red.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 3,
                                  color: Colors.grey.shade300,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: Text(
                                    DateFormat('h:mm a').format(DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      widget.startTime.hour,
                                      widget.startTime.minute,
                                    )),
                                    style: TextStyle(
                                      color: Colors.red.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            // routes
            Container(
              height: 780,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(27),
                  topRight: Radius.circular(27),
                ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Here are the best generated',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'itineraries just for you:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Available Time: $hours hours $minutes minutes',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 700,
                    // color: Colors.black,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = -1; i < widget.topN - 1; i++)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            // route 1
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  widget.routeindex = '${i + 1}';
                                  // widget.topN = widget.topN + 1;
                                  debugPrint(widget.topN.toString());
                                });
                                debugPrint('Route index: ${widget.routeindex}');
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return ExplorerMapPage(
                                        Email: widget.Email,
                                        UID: widget.UID,
                                        // firstLocation: widget.firstLocation,
                                        secondLocation: widget.secondLocation,
                                        startTime: widget.startTime,
                                        endTime: widget.endTime,
                                        selectedIconIndex:
                                            widget.selectedIconIndex,
                                        endDestinationChoice:
                                            widget.endDestinationChoice,
                                        topK: widget.topK,
                                        topN: widget.topN,
                                        latStart: widget.latStart,
                                        latEnd: widget.latEnd,
                                        longStart: widget.longStart,
                                        longEnd: widget.longEnd,
                                        routeindex: widget.routeindex,

                                        // route: widget.route,
                                        // dateandTime: widget.dateandTime,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                height: 120,
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(27),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Row(
                                        children: [
                                          // TextButton(
                                          //   onPressed: () {
                                          //     widget.routeindex =
                                          //         'Route ${i + 1}';
                                          //     debugPrint(
                                          //         'Selected Route: ${widget.routeindex}');
                                          //   },
                                          //   child: Text(
                                          //     'Route ${i + 1} ',
                                          //     style: const TextStyle(
                                          //       fontWeight: FontWeight.w500,
                                          //       color: Colors.grey,
                                          //       fontSize: 16,
                                          //     ),
                                          //   ),
                                          // )
                                          Text(
                                            'Route ${i + 1} ',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                          // Text(
                                          //   '(RECOMMENDED)',
                                          //   style: TextStyle(
                                          //     fontWeight: FontWeight.w500,
                                          //     color: Colors.grey.shade600,
                                          //     fontSize: 15,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 15),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.directions_walk,
                                            color: Colors.grey.shade600,
                                          ),
                                          Text(
                                            '50 min ',
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              'Walk straight to ___ (??m) ',
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.black,
                                            size: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(),
                                            child: Text(
                                              ' Turn ...',
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
