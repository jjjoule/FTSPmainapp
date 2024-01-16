// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:project/pages/main/planner/editplan.dart';
// import 'package:project/pages/main/planner/planner.dart';

// class CreatePlanPage extends StatefulWidget {
//   String startDate = '';

//   String endDate = '';

//   CreatePlanPage({
//     Key? key,
//     required this.startDate,
//     required this.endDate,
//   }) : super(key: key);

//   @override
//   State<CreatePlanPage> createState() => _CreatePlanPageState();
// }

// class _CreatePlanPageState extends State<CreatePlanPage> {
//   final formKey = GlobalKey<FormState>();

//   TextEditingController dateController = TextEditingController();

//   TextEditingController dateController2 = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: buildMyNavBar(context),
//     );
//   }

//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       child: Form(
//         key: formKey,
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
//                             return const PlannerPage();
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
//                       'Plan a trip',
//                       style:
//                           TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(top: 28.0, right: 250, bottom: 10),
//               child: Text(
//                 'Where to?',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 21,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(),
//               child: Container(
//                 height: 60,
//                 width: 350,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(
//                     color: Colors.black.withOpacity(1),
//                     width: 0.7,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.only(top: 18.0, left: 20),
//                   child: Text(
//                     'Local',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 28.0, bottom: 10),
//               child: Row(
//                 children: const [
//                   Padding(
//                     padding: EdgeInsets.only(left: 22.0),
//                     child: Text(
//                       'Start Date',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 21,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 103.0),
//                     child: Text(
//                       'End Date',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 21,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 21),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     height: 80,
//                     width: 155,
//                     child: TextFormField(
//                       controller: dateController,
//                       decoration: InputDecoration(
//                         border: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                         hintText: widget.startDate,
//                         hintStyle: TextStyle(
//                           color: Colors.grey.shade400,
//                           fontSize: 15,
//                         ),
//                         suffixIcon: IconButton(
//                           onPressed: () async {
//                             DateTime? pickedDate1 = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime.now(),
//                               lastDate: DateTime(2101),
//                             );
//                             dateController.text = widget.startDate;
//                             if (pickedDate1 != null) {
//                               String formattedDate =
//                                   DateFormat("dd-MM-yyyy").format(pickedDate1);
//                               setState(
//                                 () {
//                                   dateController.text =
//                                       formattedDate.toString();
//                                 },
//                               );
//                             } else {
//                               debugPrint('no date has been selected');
//                             }
//                           },
//                           icon: const Icon(Icons.calendar_month),
//                         ),
//                       ),
//                       keyboardType: TextInputType.datetime,
//                       validator: (value1) {
//                         if (value1!.trim().isEmpty) {
//                           return 'Start Date is required';
//                         }
//                         // if(!dateRegExp.hasMatch(value)){
//                         //   return 'Invalid Date';
//                         // }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 41.0),
//                     child: SizedBox(
//                       height: 80,
//                       width: 155,
//                       child: TextFormField(
//                         controller: dateController2,
//                         decoration: InputDecoration(
//                           border: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                           ),
//                           hintText: widget.endDate,
//                           hintStyle: TextStyle(
//                             color: Colors.grey.shade400,
//                             fontSize: 15,
//                           ),
//                           suffixIcon: IconButton(
//                             onPressed: () async {
//                               DateTime? pickedDate2 = await showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime.now(),
//                                 lastDate: DateTime(2101),
//                               );
//                               // if(dateController.text == ''){
//                               //   setState(() {
//                               //     dateController.text = widget.startDate;
//                               //   });
//                               // }
//                               if (pickedDate2 != null) {
//                                 String formattedDate = DateFormat("dd-MM-yyyy")
//                                     .format(pickedDate2);
//                                 setState(
//                                   () {
//                                     dateController2.text =
//                                         formattedDate.toString();
//                                   },
//                                 );
//                               } else {
//                                 debugPrint("No date selected");
//                               }
//                             },
//                             icon: const Icon(Icons.calendar_month),
//                           ),
//                         ),
//                         keyboardType: TextInputType.datetime,
//                         validator: (value2) {
//                           if (value2!.trim().isEmpty) {
//                             return 'End Date is required';
//                           }
//                           // if(!dateRegExp.hasMatch(value)){
//                           //   return 'Invalid Date';
//                           // }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(right: 184, bottom: 10, top: 18),
//               child: Text(
//                 'Add a description',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 21,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(),
//               child: SizedBox(
//                 height: 80,
//                 width: 352,
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                     hintText: ' I love exploring etc.',
//                     hintStyle: TextStyle(
//                       color: Colors.grey.shade400,
//                       fontSize: 15,
//                     ),
//                   ),
//                   keyboardType: TextInputType.datetime,
//                   // validator: (value2) {
//                   //   if (value2!.trim().isEmpty) {
//                   //     return 'Destination is require';
//                   //   }
//                   //   // if(!dateRegExp.(value)){
//                   //   //   return 'Invalid Date';
//                   //   // }
//                   //   return null;
//                   // },
//                 ),
//               ),
//             ),
//             // const Padding(
//             //   padding: EdgeInsets.only(top: 28),
//             // ),
//             // const SizedBox(
//             //   height: 50,
//             // ),
//             Image.asset(
//               'assets/buffcar.jpg',
//               height: 133,
//               scale: 0.9,
//             ),
//             const SizedBox(
//               height: 32,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (BuildContext context) {
//                           return EditPlannerPage(
//                             startLocation: 'Select start location',
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
//                             startTime: '+',
//                           );
//                         },
//                       ),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red.shade600,
//                     foregroundColor: Colors.white,
//                     minimumSize: const Size(360, 60),
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     ))),
//                 child: const Text(
//                   'Create trip!!',
//                   style: TextStyle(
//                     fontSize: 17,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

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
