import 'package:flutter/material.dart';

class Selectmode extends StatefulWidget {
  Selectmode({super.key});

  @override
  State<Selectmode> createState() => _SelectmodeState();
}

class _SelectmodeState extends State<Selectmode> {
  bool _ecomode=false;
  bool _expressmode=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1049),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1049),
        title: const Text(
          "Current Orders",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align questions to the left
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                     const Icon(
                      Icons.arrow_forward, // Arrow icon on the left
                      color: Colors.white,
                      size: 20,
                    ),
                     const SizedBox(width: 8),
                    const Text(
                      "Want to deliver eco-friendly?",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Centered image and checkbox for Eco mode
              Center(
                child: Column(
                  children: [
                    Image.asset("assets/eco_mode.png"),
                    const SizedBox(height: 30),
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(8),
                        
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center checkbox and text
                        children: [
                          Checkbox(
                            value: _ecomode,
                            onChanged: (bool? value) {
                              setState(() {
                                _ecomode = value ?? false;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Colors.transparent,
                             side: const BorderSide(color: Colors.white, width: 1),
                          
                          ),
                          const Text(
                            "Eco mode",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Left-aligned question for Express Mode
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  
                  children: [
                    const Icon(
                      Icons.arrow_forward, // Arrow icon on the left
                      color: Colors.white,
                      size: 20,
                    ),
                     const SizedBox(width: 8),
                    const Text(
                      "Want to deliver fastly?",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Centered image and checkbox for Express mode
              Center(
                child: Column(
                  children: [
                    Image.asset("assets/express_mode.png"),
                    const SizedBox(height: 30),
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center checkbox and text
                        children: [
                          Checkbox(
                            value: _expressmode,
                            onChanged: (bool? value) {
                              setState(() {
                                _expressmode = value ?? false;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Colors.transparent,
                             side: const BorderSide(color: Colors.white, width: 1),
                           
                          ),
                          const Text(
                            "Express mode",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Centered Proceed button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Proceed Button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F1049),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  child: const Text(
                    "Proceed",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}