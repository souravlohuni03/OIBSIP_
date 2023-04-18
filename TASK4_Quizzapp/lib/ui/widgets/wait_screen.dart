import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaitScreen extends StatefulWidget {
  const WaitScreen({super.key});

  @override
  State<WaitScreen> createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {
  // late final AnimationController _controllerBird;

  // @override
  // void initState() {
  //   super.initState();

  //   _controllerBird=
  //       AnimationController(vsync: this, duration: const Duration(seconds: 10));
  // }

  // @override
  // void dispose() {
  //   _controllerBird.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottieanimation/blue-bird-waiting.json',
            width: 200,
            height: 200,
          ),
          const Text(
            "\"Don't be angry like that bird.\"",
            style: TextStyle(
                fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
          ),
          const Text(
            "Please be patient while \nwe are fetching best questions for you.",
            style: TextStyle(fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Be Ready with Your pen and notebook.",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 18, 105, 63)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
