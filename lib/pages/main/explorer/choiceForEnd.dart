import 'package:flutter/material.dart';
import 'package:project/pages/main/explorer/explorer.dart';
import 'package:project/pages/main/explorer/searchlocation2.dart';

import '../../../constants.dart';

class ChoiceForEndPage extends StatefulWidget {
  String Email;

  String UID;

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

  ChoiceForEndPage({
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
  State<ChoiceForEndPage> createState() => _ChoiceForEndPageState();
}

class _ChoiceForEndPageState extends State<ChoiceForEndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28, bottom: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: IconButton(
                    onPressed: () {
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
                              endDestinationChoice: widget.endDestinationChoice,
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
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    "Select end waypoint",
                    style: TextStyle(
                        color: textColorLightTheme,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          // const Center(
          //   child: Text(
          //     'How would you like to end your journey',
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 65,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 120),
                elevation: 5,
                shadowColor: Colors.grey,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ExplorerPage(
                        Email: widget.Email,
                        UID: widget.UID,
                        // firstLocation: widget.firstLocation,
                        secondLocation: "Starting point",
                        startTime: widget.startTime,
                        endTime: widget.endTime,
                        selectedIconIndex: widget.selectedIconIndex,
                        endDestinationChoice: widget.endDestinationChoice = 2,
                        topK: widget.topK,
                        topN: widget.topN,
                        latStart: widget.latStart,
                        latEnd: widget.latStart,
                        longStart: widget.longStart,
                        longEnd: widget.longStart,
                        // dateandTime: widget.dateandTime,
                      );
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Go back to starting point',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Image.asset('assets/directions.jpg', height: 150, width: 150),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 120),
                elevation: 5,
                shadowColor: Colors.grey,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ExplorerPage(
                        Email: widget.Email,
                        UID: widget.UID,
                        // firstLocation: widget.firstLocation,
                        secondLocation: "End at itinerary",
                        startTime: widget.startTime,
                        endTime: widget.endTime,
                        selectedIconIndex: widget.selectedIconIndex,
                        endDestinationChoice: widget.endDestinationChoice = 1,
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
              child: Row(
                children: [
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'End at itinerary (suggested)',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Image.asset('assets/adventure.jpg', height: 150, width: 150),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 120),
                elevation: 5,
                shadowColor: Colors.grey,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SearchLocationPage2(
                        Email: widget.Email,
                        UID: widget.UID,
                        // firstLocation: widget.firstLocation,
                        secondLocation: widget.secondLocation,
                        startTime: widget.startTime,
                        endTime: widget.endTime,
                        selectedIconIndex: widget.selectedIconIndex,
                        endDestinationChoice: widget.endDestinationChoice = 3,
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
              child: Row(
                children: [
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Choose your own location',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset('assets/choose_location.jpg',
                        height: 150, width: 140),
                  ),
                ],
              ),
            ),
          ),
          //  Container(
          //   height: 30,
          //   width: 50,
          //   color: Colors.black,
          // )
        ],
      ),
    );
  }
}
