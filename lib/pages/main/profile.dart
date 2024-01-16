import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/LandingPage.dart';
import 'package:project/pages/main/explorer/currentlocation.dart';
import 'package:project/pages/main/explorer/explorer.dart';
import 'package:project/pages/main/settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  String Email;

  String UID;

  ProfilePage({
    Key? key,
    required this.UID,
    required this.Email,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int pageIndex = 0;

  TimeOfDay startTime = TimeOfDay.now();

  TimeOfDay endTime = TimeOfDay.now();

  void makePostRequest() async {
    var url = 'http://10.0.2.2:7687/getrecommendation';

    int convertToSeconds(int hour, int min) {
      var totalSeconds = (hour * 3600) + (min * 60);
      return totalSeconds.toInt();
    }

    var UserAvailHour = 8;
    var UserAvailMin = 0;

    var jsondata = {
      'uid': "108938050734323740126",
      'request_model_to_predict_ranked_pois_given_uid': "200",
      'topk': "2",
      'topn': "3",
      'useravailtime': convertToSeconds(UserAvailHour, UserAvailMin),
      'vehiclemode': "2",
      'mode': "1",
      'userendpoi': "lower seletar reservoir",
      // 'latuser': "1.2931",
      // 'longuser': "103.8520",
      'latuser': "1.3792633",
      'longuser': "103.8486083",
      'allow_consecutive_foodpoi_in_itinerary': true,
      // 'StartDateTime': DateTime.now().toIso8601String(),
      'StartDateTime': "2023-05-23 12:00:00"
    };

    var body = jsonEncode(jsondata);

    var headers = {'Content-Type': 'application/json'};

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      // Request was successful
      print('POST request successful profile');
      print('Response body: ${response.body}');
    } else {
      // Request failed
      print('POST request failed with status code ${response.statusCode}');
    }
  }

  void main() {
    makePostRequest();
  }

  // void main() {
  //   Map<String, String> jsonData = {
  //     'uid': '112517760383136920868',
  //     'topk': '5', // pois per itinerary
  //     'topn': '3', // itineraries
  //     'useravailtime': '413453',
  //     'vehiclemode': '2',
  //     'mode': '1',
  //     'userendpoi': '0x31da11ca5e6684c70x8e028c772691d293',
  //     'latuser': '1.5234214',
  //     'longuser': '1.3523531',
  //   };

  //   String apiUrl =
  //       "http://10.0.2.2:7687/getrecommendation";

  //   http.post(Uri.parse(apiUrl), body: jsonData).then((response) {
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       print(jsonResponse);
  //     } else {
  //       print('Request failed with status profile: ${response.statusCode}.');
  //     }
  //   }).catchError((error) {
  //     print('Error: $error');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffC4DFCB),
      // body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              height: 150,
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
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.red.shade600,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 146, top: 45),
                        child: Text(
                          'User',
                          style: TextStyle(
                            color: Colors.red.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: SizedBox(
                          // color: Colors.red,
                          width: 190,
                          child: Text(
                            widget.Email,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 170),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.edit),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Log Out                                   ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const LandingPage();
                                  },
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const LandingPage();
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                // const SizedBox(height: 37),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.question_answer_outlined,
                //       color: Colors.grey.shade700,
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 25.0),
                //       child: Text(
                //         'Help & Feedback',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.grey.shade700,
                //           fontSize: 15,
                //         ),
                //       ),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.only(left: 87.0),
                //       child: Icon(
                //         Icons.arrow_forward_ios_rounded,
                //         size: 15,
                //       ),
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 50,
                // ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.people_alt_outlined,
                //       color: Colors.grey.shade700,
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 25.0),
                //       child: Text(
                //         'Invite a friend',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.grey.shade700,
                //           fontSize: 15,
                //         ),
                //       ),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.only(left: 108.0),
                //       child: Icon(
                //         Icons.arrow_forward_ios_rounded,
                //         size: 15,
                //       ),
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 50,
                // ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.bookmark_border_rounded,
                //       color: Colors.grey.shade700,
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 25.0),
                //       child: Text(
                //         'Saved',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.grey.shade700,
                //           fontSize: 15,
                //         ),
                //       ),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.only(left: 159.0),
                //       child: Icon(
                //         Icons.arrow_forward_ios_rounded,
                //         size: 15,
                //       ),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Settings                                  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return SettingsPage(
                                      Email: widget.Email,
                                      UID: widget.UID,
                                    );
                                  },
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return SettingsPage(
                                  Email: widget.Email,
                                  UID: widget.UID,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                // ElevatedButton(
                //   onPressed: main,
                //   child: const Text('hi'),
                // )
              ],
            ),
          ),
          const SizedBox(
            height: 280,
          ),

          // bottom navigation bar!!!!
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Container(
              width: 360,
              height: 60,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ExplorerPage(
                                Email: widget.Email,
                                UID: widget.UID,
                                // firstLocation: 'Search destination',
                                secondLocation: 'Search destination',
                                startTime: startTime,
                                endTime: endTime,
                                selectedIconIndex: -1,
                                endDestinationChoice: 0,
                                topK: 2,
                                topN: 2,
                                latStart: 0,
                                latEnd: 0,
                                longStart: 0,
                                longEnd: 0,
                                // dateandTime: "",
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.home_filled,
                        color: Colors.black,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return UserCurrentLocation(
                                Email: widget.Email,
                                UID: widget.UID,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                        size: 30,
                      )),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pushReplacement(
                  //         MaterialPageRoute(
                  //           builder: (BuildContext context) {
                  //             return const PlannerPage();
                  //           },
                  //         ),
                  //       );
                  //     },
                  //     icon: const Icon(
                  //       Icons.calendar_month,
                  //       color: Colors.black,
                  //       size: 30,
                  //     )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.red.shade600,
                        size: 30,
                      )),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pushReplacement(
                  //         MaterialPageRoute(
                  //           builder: (BuildContext context) {
                  //             return const PointsPage();
                  //           },
                  //         ),
                  //       );
                  //     },
                  //     icon: const Icon(
                  //       Icons.wallet_giftcard_rounded,
                  //       color: Colors.black,
                  //       size: 30,
                  //     )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
