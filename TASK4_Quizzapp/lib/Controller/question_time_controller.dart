import 'package:flutter/animation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

bool onceVisited = false;

class QuestionTimeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  @override
  void onInit() {
    super.onInit();

    onceVisited = true;
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward();
  }

  void resetAnimationController() {
    _animationController.reset();
    _animationController.forward();
    update();
  }

  void startAgainAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
  }

  void resetAnimation() {
    _animationController.reset();
    _animationController.forward();
    update();
  }

  @override
  void dispose() {
    _animationController.dispose();

    // Stop the controller when the widget is disposed

    super.dispose();
  }
}
