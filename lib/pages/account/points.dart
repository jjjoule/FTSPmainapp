// import 'package:flutter/material.dart';
// import 'package:project/pages/main/explorer/explorer.dart';
// import 'package:project/pages/main/home.dart';
// import 'package:project/pages/main/planner/planner.dart';
// import 'package:project/pages/main/profile.dart';

// class PointsPage extends StatefulWidget {
//   const PointsPage({Key? key}) : super(key: key);

//   @override
//   _PointsPageState createState() => _PointsPageState();
// }

// class _PointsPageState extends State<PointsPage> {
//   int pageIndex = 0;

//   TimeOfDay startTime = TimeOfDay.now();

//   TimeOfDay endTime = TimeOfDay.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: const Color(0xffC4DFCB),
//       // body: pages[pageIndex],
//       bottomNavigationBar: buildMyNavBar(context),
//     );
//   }

//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 70, right: 220, bottom: 10),
//             child: Text(
//               'Buff Rewards',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(),
//             child: Container(
//               height: 100,
//               width: 350,
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
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Container(
//                       height: 70,
//                       width: 70,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                       child: Image.asset('assets/red.jpg'),
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(right: 15, top: 20, left: 5),
//                         child: Text(
//                           '9999999999 points       Diamond',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 13,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5, right: 15),
//                         child: Container(
//                           height: 18,
//                           width: 250,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade300,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: 18,
//                                 width: 170,
//                                 decoration: BoxDecoration(
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Colors.orange,
//                                       Colors.red,
//                                     ],
//                                   ),
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 514,
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
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               return ExplorerPage(
//                                 Email: '',
//                                 firstLocation: 'Select mode',
//                                 secondLocation: 'Select mode',
//                                 startTime: startTime,
//                                 endTime: endTime,
//                                 selectedIconIndex: -1,
//                                 endDestinationChoice: 0,
//                                 topK: 2,
//                                 topN: 2,
//                                 latStart: 0,
//                                 latEnd: 0,
//                                 longStart: 0,
//                                 longEnd: 0,
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       icon: const Icon(
//                         Icons.location_on_outlined,
//                         color: Colors.black,
//                         size: 30,
//                       )),
//                   IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               return const PlannerPage();
//                             },
//                           ),
//                         );
//                       },
//                       icon: const Icon(
//                         Icons.calendar_month,
//                         color: Colors.black,
//                         size: 30,
//                       )),
//                   IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               return ProfilePage(
//                                 Email: '',
//                               );
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
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.wallet_giftcard_rounded,
//                         color: Colors.red.shade600,
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
