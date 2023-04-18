import 'package:flutter/material.dart';

import '../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(30),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            model.image,
            height: size.height * 0.5,
          ),
          Column(
            children: [
              Center(
                child: Text(
                  model.title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                model.subTitle,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
