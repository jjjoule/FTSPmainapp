// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:project/pages/main/planner/editplan.dart';

// import '../../../constants.dart';

// class PlannerMapPage extends StatefulWidget {
//   const PlannerMapPage({Key? key}) : super(key: key);

//   @override
//   State<PlannerMapPage> createState() => PlannerMapPageState();
// }

// class PlannerMapPageState extends State<PlannerMapPage> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
//   static const LatLng destination = LatLng(37.33429383, -122.06600055);

//   List<LatLng> polyLineCoordinates = [];

//   void getPolyPoints() async {
//     PolylinePoints polylinePoints = PolylinePoints();

//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       google_api_key,
//       PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//       PointLatLng(destination.latitude, destination.longitude),
//     );

//     if (result.points.isNotEmpty) {
//       for (var point in result.points) {
//         polyLineCoordinates.add(
//           LatLng(point.latitude, point.longitude),
//         );
//       }

//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     getPolyPoints();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (BuildContext context) {
//                   return EditPlannerPage(
//                     startLocation: '9 Raffles Place #25-00',
//                     endDestination: 'Plaza Singapura',
//                     itinerary: RichText(
//                       text: const TextSpan(
//                         children: [
//                           TextSpan(
//                             text: '      Starbucks Cafe',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 21,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     startTime: '8.00 am',
//                   );
//                 },
//               ),
//             );
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_new_outlined,
//             color: Colors.black,
//           ),
//         ),
//         title: const Padding(
//           padding: EdgeInsets.only(left: 60.0),
//           child: Text(
//             "Planner Map Page",
//             style: TextStyle(color: Colors.black, fontSize: 16),
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: GoogleMap(
//         initialCameraPosition: const CameraPosition(
//           target: sourceLocation,
//           zoom: 14.5,
//         ),
//         polylines: {
//           Polyline(
//             polylineId: const PolylineId("route"),
//             points: polyLineCoordinates,
//           ),
//         },
//         markers: {
//           const Marker(
//             markerId: MarkerId("source"),
//             position: sourceLocation,
//           ),
//           const Marker(
//             markerId: MarkerId("destination"),
//             position: destination,
//           ),
//         },
//       ),
//     );
//   }
// }
