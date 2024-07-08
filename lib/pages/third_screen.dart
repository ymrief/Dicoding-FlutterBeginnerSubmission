import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:submission/pages/first_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/gift.json"),
            Text(
              "KAMU BERHASIL",
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'Cinzel'
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FirstScreen();
              }));
            }, child: const Text('Kembali'))
          ]
        )
      ),
    );
  }
}
