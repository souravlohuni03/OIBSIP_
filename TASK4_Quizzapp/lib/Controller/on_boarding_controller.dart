import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../Screen/on_boarding_page_widget.dart';
import '../models/model_on_boarding.dart';
import '../src/constants/colors.dart';
import '../src/constants/image_strings.dart';
import '../src/constants/text.dart';

class OnBoardingController extends GetxController {
  RxInt currentPage = 0.obs; //so that getx can observe currentPage

  final controller = LiquidController();
  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
      tOnBoardingImage1,
      onBoardingPage1Title,
      onBoardingPage1SubTitle,
      "1/3",
      tOnBoardingPage1Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      tOnBoardingImage2,
      onBoardingPage2Title,
      onBoardingPage2SubTitle,
      "2/3",
      tOnBoardingPage2Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      tOnBoardingImage3,
      onBoardingPage3Title,
      onBoardingPage3SubTitle,
      "3/3",
      tOnBoardingPage3Color,
    ))
  ];
  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
