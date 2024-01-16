// import 'package:flutter/material.dart';
// import 'package:project/pages/main/planner/editplan.dart';

// class ItinerarySelectionPage extends StatefulWidget {
//   const ItinerarySelectionPage({super.key});

//   @override
//   State<ItinerarySelectionPage> createState() => _ItinerarySelectionPageState();
// }

// class _ItinerarySelectionPageState extends State<ItinerarySelectionPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 70.0, left: 15, right: 30),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (BuildContext context) {
//                             return EditPlannerPage(
//                               startLocation: '9 Raffles Place #25-00',
//                               endDestination: 'Select end destination',
//                               itinerary: RichText(
//                                 text: TextSpan(
//                                   children: [
//                                     TextSpan(
//                                       text: 'Add an itinerary',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade400,
//                                         fontSize: 21,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     const TextSpan(
//                                       text: '                   +',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 30,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               startTime: '8.00 am',
//                             );
//                           },
//                         ),
//                       );
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back_ios_new_outlined,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 80.0),
//                     child: Text(
//                       'Edit planner',
//                       style:
//                           TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 71),
//                     child: Icon(Icons.search_sharp),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Container(
//                 height: 180,
//                 width: 340,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: 25, bottom: 25, right: 11, left: 11),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         height: 60,
//                         width: 60,
//                         decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: const Icon(
//                           Icons.fastfood,
//                           color: Colors.white,
//                           size: 35,
//                         ),
//                       ),
//                       Text(
//                         'Eateries',
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         height: 60,
//                         width: 60,
//                         decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: const Icon(
//                           Icons.attractions,
//                           color: Colors.white,
//                           size: 35,
//                         ),
//                       ),
//                       Text(
//                         'Attractions',
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         height: 60,
//                         width: 60,
//                         decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: const Icon(
//                           Icons.question_mark,
//                           color: Colors.white,
//                           size: 35,
//                         ),
//                       ),
//                       Text(
//                         'Lorem',
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         height: 60,
//                         width: 60,
//                         decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: const Icon(
//                           Icons.question_mark,
//                           color: Colors.white,
//                           size: 35,
//                         ),
//                       ),
//                       Text(
//                         'Lorem',
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 25, right: 25),
//               child: Row(
//                 children: [
//                   Column(
//                     children: [
//                       const Text(
//                         'Recommended for you',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 21),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 43.0),
//                         child: Text(
//                           'Specially talored for you!!',
//                           style: TextStyle(
//                               color: Colors.grey.shade500,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20, left: 75),
//                     child: Text(
//                       'View all',
//                       style: TextStyle(
//                           color: Colors.grey.shade500,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: SizedBox(
//                 height: 220,
//                 width: 350,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 25, bottom: 25, right: 30, left: 5),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) {
//                                 return EditPlannerPage(
//                                   startLocation: '9 Raffles Place #25-00',
//                                   endDestination: 'Select end destination',
//                                   itinerary: RichText(
//                                     text: const TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: '      Acid bar',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 21,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   startTime: '8.00 am',
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: Container(
//                           width: 250,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 7,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                             borderRadius: BorderRadius.circular(27),
//                           ),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   width: 250.0,
//                                   height: 90.0,
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image:
//                                             AssetImage('assets/AcidBar.jpg')),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     // color: Colors.redAccent,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 14.0),
//                                     child: Text(
//                                       'Acid Bar',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 115),
//                                     child: Text(
//                                       "\$\$",
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Text(
//                                       "4.1",
//                                       style: TextStyle(
//                                         color: Colors.yellow,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10.0),
//                                     child: Icon(
//                                       Icons.location_on,
//                                       color: Colors.red.shade600,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Somewhere',
//                                     style: TextStyle(
//                                       color: Colors.red.shade600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 110),
//                                     child: Text(
//                                       '?? min',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade400,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 25,
//                         bottom: 25,
//                         right: 30,
//                       ),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) {
//                                 return EditPlannerPage(
//                                   startLocation: '9 Raffles Place #25-00',
//                                   endDestination: 'Select end destination',
//                                   itinerary: RichText(
//                                     text: const TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: '      Starbucks Cafe',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 21,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   startTime: '8.00 am',
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: Container(
//                           width: 250,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 7,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                             borderRadius: BorderRadius.circular(27),
//                           ),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   width: 250.0,
//                                   height: 90.0,
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image:
//                                             AssetImage('assets/Starbucks.jpg')),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     // color: Colors.redAccent,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 14.0),
//                                     child: Text(
//                                       'Starbucks Cafe',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 72),
//                                     child: Text(
//                                       "\$\$",
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Text(
//                                       "4.7",
//                                       style: TextStyle(
//                                         color: Colors.yellow,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10.0),
//                                     child: Icon(
//                                       Icons.location_on,
//                                       color: Colors.red.shade600,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Somewhere',
//                                     style: TextStyle(
//                                       color: Colors.red.shade600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 110),
//                                     child: Text(
//                                       '?? min',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade400,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 25,
//                         bottom: 25,
//                         right: 30,
//                       ),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) {
//                                 return EditPlannerPage(
//                                   startLocation: '9 Raffles Place #25-00',
//                                   endDestination: 'Select end destination',
//                                   itinerary: RichText(
//                                     text: const TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: '      Ikea',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 21,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   startTime: '8.00 am',
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: Container(
//                           width: 250,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 7,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                             borderRadius: BorderRadius.circular(27),
//                           ),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   width: 250.0,
//                                   height: 90.0,
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage('assets/Ikea.jpg')),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     // color: Colors.redAccent,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 14.0),
//                                     child: Text(
//                                       'Ikea',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 142),
//                                     child: Text(
//                                       "\$\$",
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Text(
//                                       "4.2",
//                                       style: TextStyle(
//                                         color: Colors.yellow,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10.0),
//                                     child: Icon(
//                                       Icons.location_on,
//                                       color: Colors.red.shade600,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Somewhere',
//                                     style: TextStyle(
//                                       color: Colors.red.shade600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 110),
//                                     child: Text(
//                                       '?? min',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade400,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(),
//               child: Row(
//                 children: [
//                   Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(right: 12),
//                         child: Text(
//                           'Places near you',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 21),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 23),
//                         child: Text(
//                           'We thought you might like...',
//                           style: TextStyle(
//                               color: Colors.grey.shade500,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20, left: 103),
//                     child: Text(
//                       'View all',
//                       style: TextStyle(
//                         color: Colors.grey.shade500,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: SizedBox(
//                 height: 220,
//                 width: 350,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 25, bottom: 25, right: 30, left: 5),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) {
//                                 return EditPlannerPage(
//                                   startLocation: '9 Raffles Place #25-00',
//                                   endDestination: 'Select end destination',
//                                   itinerary: RichText(
//                                     text: const TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: '      MacDonalds',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 21,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   startTime: '8.00 am',
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: Container(
//                           width: 250,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 7,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                             borderRadius: BorderRadius.circular(27),
//                           ),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   width: 250.0,
//                                   height: 90.0,
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image:
//                                             AssetImage('assets/McDonalds.jpg')),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     // color: Colors.redAccent,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 14.0),
//                                     child: Text(
//                                       'MacDonalds',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 97),
//                                     child: Text(
//                                       "\$",
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Text(
//                                       "3.9",
//                                       style: TextStyle(
//                                         color: Colors.yellow,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10.0),
//                                     child: Icon(
//                                       Icons.location_on,
//                                       color: Colors.red.shade600,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Somewhere',
//                                     style: TextStyle(
//                                       color: Colors.red.shade600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 110),
//                                     child: Text(
//                                       '?? min',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade400,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 25, bottom: 25, right: 30),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) {
//                                 return EditPlannerPage(
//                                   startLocation: '9 Raffles Place #25-00',
//                                   endDestination: 'Select end destination',
//                                   itinerary: RichText(
//                                     text: const TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: '      KFC',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 21,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   startTime: '8.00 am',
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: Container(
//                           width: 250,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 7,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                             borderRadius: BorderRadius.circular(27),
//                           ),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   width: 250.0,
//                                   height: 90.0,
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage('assets/KFC.jpg')),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     // color: Colors.redAccent,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 14.0),
//                                     child: Text(
//                                       'KFC',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 150),
//                                     child: Text(
//                                       "\$",
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Text(
//                                       "3.7",
//                                       style: TextStyle(
//                                         color: Colors.yellow,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10.0),
//                                     child: Icon(
//                                       Icons.location_on,
//                                       color: Colors.red.shade600,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Somewhere',
//                                     style: TextStyle(
//                                       color: Colors.red.shade600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 110),
//                                     child: Text(
//                                       '?? min',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade400,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 25, bottom: 25, right: 30),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) {
//                                 return EditPlannerPage(
//                                   startLocation: '9 Raffles Place #25-00',
//                                   endDestination: 'Select end destination',
//                                   itinerary: RichText(
//                                     text: const TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: '      Jollibee',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 21,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   startTime: '8.00 am',
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: Container(
//                           width: 250,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 7,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                             borderRadius: BorderRadius.circular(27),
//                           ),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   width: 250.0,
//                                   height: 90.0,
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage('assets/Jollibee.jpg')),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     // color: Colors.redAccent,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 14.0),
//                                     child: Text(
//                                       'Jollibee',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 129),
//                                     child: Text(
//                                       "\$",
//                                       style: TextStyle(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(),
//                                     child: Text(
//                                       "3.9",
//                                       style: TextStyle(
//                                         color: Colors.yellow,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10.0),
//                                     child: Icon(
//                                       Icons.location_on,
//                                       color: Colors.red.shade600,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Somewhere',
//                                     style: TextStyle(
//                                       color: Colors.red.shade600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 110),
//                                     child: Text(
//                                       '?? min',
//                                       style: TextStyle(
//                                         color: Colors.grey.shade400,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
