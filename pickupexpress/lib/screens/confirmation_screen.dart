import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConfirmationPage extends StatefulWidget {
  final String pickupLocation;
  final String pincode;
  final String parcelSize;
  final String parcelType;
  final String deliveryMode;

  const ConfirmationPage({
    required this.pickupLocation,
    required this.pincode,
    required this.parcelSize,
    required this.parcelType,
    required this.deliveryMode,
    super.key,
  });

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  String? pickupDate;
  String? deliveryDate;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDates();
  }

  Future<void> _fetchDates() async {
    final url = Uri.parse('http://192.168.107.45:8000/calculate-dates/');


    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "package_size": widget.parcelSize,
          "package_type": widget.parcelType,
          "delivery_mode": widget.deliveryMode,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          pickupDate = data["pickup_date"];
          deliveryDate = data["delivery_date"];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to fetch dates");
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching dates: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Color(0xFF1F1049),
      title: const Text("Send Package",style: TextStyle(color: Colors.white)),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
          },
        ),
         iconTheme: const IconThemeData(color: Colors.white),),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                
                children: [
                  const Text("Shipping details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text("Pickup Location: ${widget.pickupLocation}"),
                  Text("Pincode: ${widget.pincode}"),
                  Text("Parcel Size: ${widget.parcelSize}"),
                  Text("Parcel Type: ${widget.parcelType}"),
                  Text("Delivery Mode: ${widget.deliveryMode}"),
                  const SizedBox(height: 20),
                  Text("Pickup Date: $pickupDate"),
                  Text("Delivery Date: $deliveryDate"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Proceed to payment or further steps
                    },
                    child: const Text('Proceed with Payment'),
                  ),
                ],
              ),
            ),
    );
  }
}
