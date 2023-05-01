import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<Position?> getCurrentLocation() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
// location is off
    if (!serviceEnabled) {
      return Future.error("location raha tafya");
    }
// location is on
    // checking if we already have the permision
    LocationPermission permission = await Geolocator.checkPermission();
    // if it is denied => ask again
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // case on the user denied it again
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // denied again , don't be samet so

        return Future.error("permission denied :)");
      }
    }
    // if (permission == LocationPermission.deniedForever) {
    //   displaySnackbar(context, "location service is desabled forever :(");
    //   return Future.error("location service is desabled forever :(");

    // }
    // else: user gave us the permission !
    // displaySnackbar(context, "Getting location ...");
    print("      SHOULD BE WORKING     loading");

    return await Geolocator.getCurrentPosition();
  } catch (e) {
    print(" ERROR:               $e");
  }
}
