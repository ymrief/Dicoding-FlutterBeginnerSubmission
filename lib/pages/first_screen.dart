import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:submission/pages/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/wave.json'),
            const Text(
              "Selamat Datang!",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cinzel'
              ),
            ),
            ElevatedButton(
              child: const Text('MASUK'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}