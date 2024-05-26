// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:project/pages/account/points.dart';
// import 'package:project/pages/main/explorer/explorer.dart';
// import 'package:project/pages/main/home.dart';
// import 'package:project/pages/main/planner/planner.dart';
// import 'package:project/pages/main/profile.dart';

// class PreviousPlannerPage extends StatefulWidget {
//   const PreviousPlannerPage({Key? key}) : super(key: key);

//   @override
//   _PreviousPlannerPageState createState() => _PreviousPlannerPageState();
// }

// class _PreviousPlannerPageState extends State<PreviousPlannerPage> {
//   int pageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: pages[pageIndex],
//       bottomNavigationBar: buildMyNavBar(context),
//     );
//   }

//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 100,
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 70.0, right: 45),
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'Current plans',
//                     style: TextStyle(
//                       color: Colors.grey.shade400,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       decoration: TextDecoration.underline,
//                     ),
//                     recognizer: TapGestureRecognizer()
//                       ..onTap = () {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               return const PlannerPage();
//                             },
//                           ),
//                         );
//                       },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 70),
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'Previous plans',
//                     style: TextStyle(
//                       color: Colors.red.shade600,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             height: 120,
//             width: 320,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 1,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(27),
//             ),
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12.0),
//                   child: SizedBox(
//                     height: 90,
//                     width: 100,
//                     child: Image.asset(
//                       'assets/explorer.jpg',
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 12.0,
//                         left: 25,
//                         bottom: 10,
//                         right: 34,
//                       ),
//                       child: Text(
//                         'Starts on 27-03-2023',
//                         style: TextStyle(
//                             color: Colors.red.shade600,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: Container(
//                         height: 2,
//                         width: 175,
//                         decoration: BoxDecoration(color: Colors.grey.shade400),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(top: 10, right: 45),
//                       child: Text(
//                         'My SG Trip',
//                         style: TextStyle(
//                             fontSize: 19, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 15.0,
//                         // left: 25,
//                         // bottom: 10,
//                         right: 72,
//                       ),
//                       child: Text(
//                         '28-03-2023',
//                         style: TextStyle(
//                             color: Colors.grey.shade400,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),

//           const SizedBox(
//             height: 458,
//           ),

//           // bottom navigation bar!!!!
//           Padding(
//             padding: const EdgeInsets.only(
//               right: 20,
//               left: 20,
//             ),
//             child: Container(
//               width: 360,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 1,
//                     blurRadius: 7,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(27),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               return const HomePage();
//                             },
//                           ),
//                         );
//                       },
//                       icon: const Icon(
//                         Icons.home_filled,
//                         color: Colors.black,
//                         size: 30,
//                       )),
//                   IconButton(
//                       onPressed: () {
//                         // Navigator.of(context).pushReplacement(
//                         //   MaterialPageRoute(
//                         //     builder: (BuildContext context) {
//                         //       return ExplorerPage(
//                         //         firstLocation: 'Select mode',
//                         //         secondLocation: 'Select mode',
//                         //         startTime: '',
//                         //         endTime: '',
//                         //       );
//                         //     },
//                         //   ),
//                         // );
//                       },
//                       icon: const Icon(
//                         Icons.location_on_outlined,
//                         color: Colors.black,
//                         size: 30,
//                       )),
//                   IconButton(
//                       onPressed: () {
//                         // Navigator.of(context).pushReplacement(
//                         //   MaterialPageRoute(
//                         //     builder: (BuildContext context) {
//                         //       return const PreviousPlannerPage();
//                         //     },
//                         //   ),
//                         // );
//                       },
//                       icon: Icon(
//                         Icons.calendar_month,
//                         color: Colors.red.shade600,
//                         size: 30,
//                       )),
//                   IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               return const ProfilePage();
//                             },
//                           ),
//                         );
//                       },
//                       icon: const Icon(
//                         Icons.person_outline_rounded,
//                         color: Colors.black,
//                         size: 30,
//                       )),
//                   IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               return const PointsPage();
//                             },
//                           ),
//                         );
//                       },
//                       icon: const Icon(
//                         Icons.wallet_giftcard_rounded,
//                         color: Colors.black,
//                         size: 30,
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
