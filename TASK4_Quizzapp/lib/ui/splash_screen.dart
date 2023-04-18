import 'package:flutter/material.dart';
import 'package:quiz_app/firebase_services/splash_services.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    splashScreen.isLogin(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            "https://assets2.lottiefiles.com/packages/lf20_w51pcehl.json"
            //   "https://lottiefiles.com/140429-pencil-drawing"
            // "https://assets5.lottiefiles.com/packages/lf20_iYvSqSMKZB.json"
            ,
            controller: _controller,
            onLoaded: (p) {
              _controller
                ..duration = p.duration
                ..forward();
            },
          ),
        ],
      ),
    );
  }
}
