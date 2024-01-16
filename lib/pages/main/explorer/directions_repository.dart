// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../../constants.dart';

// class DirectionsRepository {
//   static const String _baseUrl =
//       'https://maps.googleapis.com/maps/api/directions/json?';

//   final Dio _dio;

//   DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

//   Future<Directions> getDirections({
//     @required startingpoint,
//     @required endpoint,
//   }) async {
//     final response = await _dio.get(
//       _baseUrl,
//       queryParameters: {
//         'Starting destination': startingpoint,
//         'End Destination': endpoint,
//         'key': google_api_key,
//       },
//     );

//     //check if response is successful
//     if (response.statusCode = 200) {
//       return Directions.fromMap(response.data);
//     }
//     return null;
//   }
// }
