import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class GeoCodeTextField extends StatefulWidget {
  const GeoCodeTextField({super.key});

  @override
  State<GeoCodeTextField> createState() => _GeoCodeTextFieldState();
}

class _GeoCodeTextFieldState extends State<GeoCodeTextField> {

  String? Latitude;
  String? Longitude;

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            GooglePlaceAutoCompleteTextField(
              textEditingController: addressController,
              boxDecoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade600,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              googleAPIKey:
              "AIzaSyBpPnB6Le56oWSrap61sQsrZY3HRtr_cQU",
              inputDecoration: const InputDecoration(
                label: Text("Address"),
                border: InputBorder.none,
              ),
              debounceTime: 800,
              // default 600 ms,
              countries: const ["in"],
              isLatLngRequired: true,
              getPlaceDetailWithLatLng:
                  (Prediction prediction) {
                Latitude = "${prediction.lat}";
                Longitude = "${prediction.lng}";
                setState(() {});
              },
              itemClick: (Prediction prediction) {
                addressController.text =
                prediction.description!;
                addressController.selection =
                    TextSelection.fromPosition(TextPosition(
                        offset:
                        prediction.description!.length));
              },
            ),
            Text("Latitude $Latitude",),
            const SizedBox(height: 13,),
            Text("Longitude $Longitude",),
          ],
        ),
      ),
    );
  }
}
