// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:project/pages/main/planner/editplan.dart';

// class PlannerLocationPage1 extends StatefulWidget {
//   const PlannerLocationPage1({super.key});

//   @override
//   State<PlannerLocationPage1> createState() => _PlannerLocationPage1State();
// }

// class _PlannerLocationPage1State extends State<PlannerLocationPage1> {
//   @override
//   String firstLocation = '9 Raffles Place #25-00';

//   String tdata = DateFormat("HH:mm a").format(DateTime.now());

//   String _location = 'Search destination';

//   Container location = Container();

//   Container locationEmpty = Container();

//   Container locationplaceholder = Container(
//     height: 100,
//     width: 370,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 1,
//           blurRadius: 7,
//           offset: const Offset(0, 3),
//         ),
//       ],
//       borderRadius: BorderRadius.circular(27),
//     ),
//     child: Row(
//       children: const [
//         Padding(
//           padding: EdgeInsets.only(left: 35),
//           child: Text(
//             '9 Raffles Place #25-00',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//             ),
//           ),
//         ),
//         // Padding(
//         //   padding: EdgeInsets.only(left: 50),
//         //   child: Text(
//         //     '5pm',
//         //     style: TextStyle(
//         //       color: Colors.black,
//         //       fontSize: 20,
//         //     ),
//         //   ),
//         // ),
//       ],
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             width: 1000,
//             height: 200,
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
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 right: 10,
//                 left: 10,
//               ),
//               child: Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _location = '9 Raffles Place #25-00';
//                         location = locationplaceholder;
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       minimumSize: const Size(370, 60),
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         IconButton(
//                             color: Colors.grey.shade800,
//                             icon: const Icon(
//                               Icons.arrow_back_ios_new_outlined,
//                             ),
//                             onPressed: () {
//                               Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                   builder: (BuildContext context) {
//                                     debugPrint(tdata);
//                                     return EditPlannerPage(
//                                       startLocation: 'Select start location',
//                                       endDestination: 'Select end destination',
//                                       itinerary: RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text: 'Add an itinerary',
//                                               style: TextStyle(
//                                                 color: Colors.grey.shade400,
//                                                 fontSize: 21,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                             const TextSpan(
//                                               text: '                   +',
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 30,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       startTime: '+',
//                                     );
//                                   },
//                                 ),
//                               );
//                             }),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 99),
//                           child: SizedBox(
//                             height: 50,
//                             width: 145,
//                             child: Center(
//                               child: Text(
//                                 _location,
//                                 style: TextStyle(
//                                   color: Colors.grey.shade600,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(),
//                           child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 _location = 'Search destination';
//                                 location = locationEmpty;
//                               });
//                             },
//                             icon: Icon(
//                               Icons.close,
//                               color: Colors.grey.shade600,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             height: 560,
//             width: 1000,
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
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(27),
//                 topRight: Radius.circular(27),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 //location
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (BuildContext context) {
//                           return EditPlannerPage(
//                             startLocation: '9 Raffles Place #25-00',
//                             endDestination: 'Select end destination',
//                             itinerary: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: 'Add an itinerary',
//                                     style: TextStyle(
//                                       color: Colors.grey.shade400,
//                                       fontSize: 21,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   const TextSpan(
//                                     text: '                   +',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             startTime: tdata,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                   child: location,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
