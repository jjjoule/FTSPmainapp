// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:project/pages/main/home.dart';
// import 'package:project/pages/main/planner/createplan.dart';
// import 'package:project/pages/main/planner/itinerarylocation.dart';
// import 'package:project/pages/main/planner/plannerlocation1.dart';
// import 'package:project/pages/main/planner/plannerlocation2.dart';
// import 'package:project/pages/main/planner/plannermap.dart';

// class EditPlannerPage extends StatefulWidget {
//   String startLocation = '';

//   String endDestination = '';

//   RichText itinerary = RichText(
//     text: const TextSpan(),
//   );

//   String startTime = '';

//   EditPlannerPage({
//     Key? key,
//     required this.startLocation,
//     required this.endDestination,
//     required this.itinerary,
//     required this.startTime,
//   }) : super(key: key);

//   @override
//   State<EditPlannerPage> createState() => _EditPlannerPageState();
// }

// class _EditPlannerPageState extends State<EditPlannerPage> {
//   static const IconData coronavirus =
//       IconData(0xe199, fontFamily: 'MaterialIcons');

//   static const IconData pencil = IconData(0xf37e, fontFamily: 'MaterialIcons');

//   TimeOfDay _timeOfDay1 = const TimeOfDay(hour: 12, minute: 0);

//   void _showTimePicker1() {
//     showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     ).then((value) {
//       setState(() {
//         _timeOfDay1 = value!;
//       });
//     });
//   }

//   TimeOfDay _timeOfDay2 = const TimeOfDay(hour: 17, minute: 0);

//   void _showTimePicker2() {
//     showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     ).then((value) {
//       setState(() {
//         _timeOfDay2 = value!;
//       });
//     });
//   }

//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(top: 70.0, left: 15, right: 30),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) {
//                                 return CreatePlanPage(
//                                   startDate: ' DD-MM-YYYY',
//                                   endDate: ' DD-MM-YYYY',
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back_ios_new_outlined,
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 80.0),
//                         child: Text(
//                           'Edit planner',
//                           style: TextStyle(
//                               fontSize: 23, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 71),
//                         child: Icon(Icons.more_horiz),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                   width: 350,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 30),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.coronavirus,
//                               size: 23,
//                               color: Colors.red.shade600,
//                             ),
//                             Text(
//                               'Covid-19 Guidelines',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.red.shade600,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 30),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.hotel,
//                               size: 23,
//                               color: Colors.red.shade600,
//                             ),
//                             Text(
//                               'Hotels',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.red.shade600,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 30),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.attach_money,
//                               size: 23,
//                               color: Colors.red.shade600,
//                             ),
//                             Text(
//                               'Finances',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.red.shade600,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 30),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.airplanemode_on,
//                               size: 23,
//                               color: Colors.red.shade600,
//                             ),
//                             Text(
//                               'Flights',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.red.shade600,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 30),
//                         child: Row(
//                           children: [
//                             Icon(
//                               pencil,
//                               size: 23,
//                               color: Colors.red.shade600,
//                             ),
//                             Text(
//                               'Insurance',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.red.shade600,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 80,
//               width: 350,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 20,
//                     ),
//                     child: Container(
//                       height: 60,
//                       width: 164,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 7,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Row(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(left: 18.0),
//                             child: Text(
//                               '05/04',
//                               style: TextStyle(
//                                   fontSize: 22,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.directions_car,
//                               size: 30,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const Icon(
//                             Icons.keyboard_arrow_down_outlined,
//                             size: 30,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20.0),
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         top: 20,
//                       ),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) {
//                                 return CreatePlanPage(
//                                   startDate: ' DD-MM-YYYY',
//                                   endDate: ' DD-MM-YYYY',
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: Container(
//                           height: 60,
//                           width: 154,
//                           decoration: BoxDecoration(
//                             color: Colors.grey,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 7,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Row(
//                             children: const [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 18.0),
//                                 child: Text(
//                                   '+ Edit days',
//                                   style: TextStyle(
//                                       fontSize: 22,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // start location
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       builder: (BuildContext context) {
//                         return const PlannerLocationPage1();
//                       },
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 60,
//                   width: 360,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 1,
//                         blurRadius: 3,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(left: 20.0),
//                         child: Icon(
//                           Icons.location_on,
//                           color: Colors.black,
//                           size: 29,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(),
//                         child: SizedBox(
//                           height: 60,
//                           width: 210,
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 20, left: 15),
//                             child: Text(
//                               widget.startLocation,
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 2.0),
//                         child: Container(
//                           height: 100,
//                           width: 2,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 60,
//                         child: InkWell(
//                           onTap: () {
//                             _showTimePicker1();
//                           },
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 6.0),
//                                 child: Text(
//                                   _timeOfDay1.format(context).toString(),
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               const Icon(Icons.keyboard_arrow_down_outlined)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // add itinerary
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       builder: (BuildContext context) {
//                         return const ItinerarySelectionPage();
//                       },
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 60,
//                   width: 360,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 1,
//                         blurRadius: 3,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 30.0),
//                         child: widget.itinerary,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // end destination
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       builder: (BuildContext context) {
//                         return const PlannerLocationPage2();
//                       },
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 60,
//                   width: 360,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 1,
//                         blurRadius: 3,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20.0),
//                         child: Icon(
//                           Icons.location_on,
//                           color: Colors.red.shade600,
//                           size: 29,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(),
//                         child: SizedBox(
//                           height: 60,
//                           width: 210,
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 20, left: 15),
//                             child: Text(
//                               widget.endDestination,
//                               style: TextStyle(
//                                 color: Colors.red.shade600,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 2.0),
//                         child: Container(
//                           height: 100,
//                           width: 2,
//                           color: Colors.red.shade600,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 60,
//                         child: InkWell(
//                           onTap: () {
//                             _showTimePicker2();
//                           },
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 6.0),
//                                 child: Text(
//                                   _timeOfDay2.format(context).toString(),
//                                   style: TextStyle(
//                                     color: Colors.red.shade600,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               const Icon(
//                                 Icons.keyboard_arrow_down_outlined,
//                                 color: Colors.red,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(
//               height: 114,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 293),
//               child: InkWell(
//                 onTap: () {
//                   if (widget.startLocation == '9 Raffles Place #25-00' &&
//                       widget.endDestination == 'Plaza Singapura') {
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (BuildContext context) {
//                           return const PlannerMapPage();
//                         },
//                       ),
//                     );
//                   }
//                 },
//                 child: Container(
//                   height: 70,
//                   width: 70,
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(15)),
//                   child: const Icon(
//                     Icons.map,
//                     size: 40,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             // submit form!!
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     if (widget.startLocation == 'Select start location') {
//                       showTopSnackBar1(context);
//                     } else if (widget.endDestination ==
//                         'Select end destination') {
//                       showTopSnackBar2(context);
//                     } else {
//                       if (widget.startLocation == '9 Raffles Place #25-00' &&
//                           widget.endDestination == 'Plaza Singapura') {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               SchedulerBinding.instance
//                                   .addPostFrameCallback((_) {
//                                 Flushbar(
//                                   icon: const Icon(
//                                     Icons.message,
//                                     size: 32,
//                                     color: Colors.white,
//                                   ),
//                                   shouldIconPulse: false,
//                                   padding: const EdgeInsets.all(24),
//                                   title: 'Trip Planned Successfully',
//                                   message: 'May you have a fun time on your trip!!',
//                                   flushbarPosition: FlushbarPosition.TOP,
//                                   margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//                                   borderRadius: const BorderRadius.all(
//                                     Radius.circular(10),
//                                   ),
//                                   duration: const Duration(seconds: 3),
//                                   barBlur: 20,
//                                   backgroundColor:
//                                       Colors.green.withOpacity(0.7),
//                                 ).show(context);
//                               });

//                               return const HomePage();
//                             },
//                           ),
//                         );
//                       }
//                     }
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red.shade600,
//                   foregroundColor: Colors.white,
//                   minimumSize: const Size(360, 60),
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     ),
//                   ),
//                 ),
//                 child: const Text(
//                   'Create trip!!',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void showTopSnackBar1(BuildContext context) => Flushbar(
//         icon: const Icon(
//           Icons.error,
//           size: 32,
//           color: Colors.white,
//         ),
//         shouldIconPulse: false,
//         padding: const EdgeInsets.all(24),
//         title: 'Error message',
//         message: 'Please select a starting location',
//         flushbarPosition: FlushbarPosition.TOP,
//         margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(10),
//         ),
//         dismissDirection: FlushbarDismissDirection.HORIZONTAL,
//         barBlur: 20,
//         backgroundColor: Colors.black.withOpacity(0.7),
//       )..show(context);

//   void showTopSnackBar2(BuildContext context) => Flushbar(
//         icon: const Icon(
//           Icons.error,
//           size: 32,
//           color: Colors.white,
//         ),
//         shouldIconPulse: false,
//         padding: const EdgeInsets.all(24),
//         title: 'Error message',
//         message: 'Please select a end destination',
//         flushbarPosition: FlushbarPosition.TOP,
//         margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(10),
//         ),
//         dismissDirection: FlushbarDismissDirection.HORIZONTAL,
//         barBlur: 20,
//         backgroundColor: Colors.black.withOpacity(0.7),
//       )..show(context);
// }
