import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            color: Color(0xFF1F1049),
            child: Column(
            children: [
          
              Image.asset("assets/icon2.png"),
              Text("Quick, reliable, and always on time—order now!"),
              SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get Started"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
            ],
          ) 
          
        ),
      ),
    );
  }
}