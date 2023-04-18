import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz_app/Controller/question_time_controller.dart';

class TimeBar extends StatelessWidget {
  const TimeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 18,
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 105, 113, 146), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionTimeController>(
          init: QuestionTimeController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                    builder: (context, constraints) => Container(
                          width:
                              constraints.maxWidth * controller.animation.value,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.blue,
                                Colors.red,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(controller.animation.value * 60).round()} sec",
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      const Icon(
                        Icons.timer_outlined,
                        size: 12,
                      ),
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
