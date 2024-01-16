// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:project/pages/account/points.dart';
// import 'package:project/pages/main/explorer/explorer.dart';
// import 'package:project/pages/main/home.dart';
// import 'package:project/pages/main/planner/createplan.dart';
// import 'package:project/pages/main/planner/previousplans.dart';
// import 'package:project/pages/main/profile.dart';

// class PlannerPage extends StatefulWidget {
//   const PlannerPage({Key? key}) : super(key: key);

//   @override
//   _PlannerPageState createState() => _PlannerPageState();
// }

// class _PlannerPageState extends State<PlannerPage> {
//   int pageIndex = 0;

//   TextEditingController dateController = TextEditingController();


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
//                       text: 'Current plans',
//                       style: TextStyle(
//                         color: Colors.red.shade600,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         decoration: TextDecoration.underline,
//                       )),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 70),
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'Previous plans',
//                     style: TextStyle(
//                       color: Colors.grey.shade400,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     recognizer: TapGestureRecognizer()
//                       ..onTap = () {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               return const PreviousPlannerPage();
//                             },
//                           ),
//                         );
//                       },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),

//           InkWell(
//             onTap: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (BuildContext context) {
//                     return CreatePlanPage(
//                       startDate: ' DD-MM-YYYY',
//                       endDate: ' DD-MM-YYYY',
//                     );
//                   },
//                 ),
//               );
//             },
//             child: Container(
//               height: 130,
//               width: 320,
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
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, top: 50),
//                 child: RichText(
//                   text: const TextSpan(
//                     children: [
//                       TextSpan(
//                         text: '                   +',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'Add new plan',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
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
//                         'Starts on 05-04-2023',
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
//                         '05-04-2023',
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
//             height: 308,
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
//                         //         firstLocation: 'Search destination',
//                         //         secondLocation: 'Search destination',
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
//                         //       return const PlannerPage();
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
