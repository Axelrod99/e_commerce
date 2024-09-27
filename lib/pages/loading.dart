import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> _loadHomeDetails() async {
    await Future.delayed(const Duration(seconds: 4)); // Simulate loading time
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();

    _loadHomeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Illustration.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                "World Beyond The Camera",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
