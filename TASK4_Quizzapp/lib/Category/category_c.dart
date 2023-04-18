// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/adding_array_data.dart';
import 'package:quiz_app/ui/posts/add_posts.dart';
import 'package:quiz_app/ui/posts/post_screen.dart';
import 'package:quiz_app/ui/posts/pseudo_category.dart';
import '../Controller/question_time_controller.dart';
import '../ui/auth/login_with_phone_number.dart';

class CategoryC extends StatefulWidget {
  const CategoryC({super.key});

  @override
  State<CategoryC> createState() => _CategoryCState();
}

class _CategoryCState extends State<CategoryC> {
  @override
  void initState() {
    print("in init state function of C topic list");
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("in iwidgetbinding ");
      if (mounted) {
        setState(() {
          startAnimation = true;
        });
      }
    });
  }

  List<String> texts = [
    "Arrays",
    "String",
    "Pointer",
    "Structure /Union",
    "Declaration",
    "Coding questions",
  ];
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        print("in iwill pop scope ");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PseudoCategory()),
        );
        return false;
      },
      child: Scaffold(
        body: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 59, 43, 97),
                Color.fromARGB(255, 25, 81, 130),
                Color.fromARGB(255, 99, 51, 161)
              ])),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PseudoCategory()),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      const Text("CATEGORY",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: texts.length,
                    itemBuilder: (context, index) {
                      return item(index);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget item(int index) {
    Color color = const Color.fromARGB(208, 220, 218, 228);

    return GestureDetector(
      onTap: () {
        print("index count in C list ");
        print(index);
        if (onceVisited && !mounted) {}
        if (index == 0) {
          print("pressing array list");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddingArrayData()));
        } else if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddingArrayData()));
        } else if (index == 2) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginWithPhoneNumber()));
        } else if (index == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PostScreen()));
        } else if (index == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FeedbackScreen()));
        } else if (index == 5) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginWithPhoneNumber()));
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 3000 + (index * 200)),
        curve: Curves.bounceOut,
        transform:
            Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
        height: 90,
        width: screenWidth,
        margin: const EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: color, blurRadius: 5)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${index + 1}. ${texts[index]}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
