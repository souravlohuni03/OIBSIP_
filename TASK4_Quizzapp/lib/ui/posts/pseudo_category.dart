import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/Category/category_c.dart';
import 'package:quiz_app/feedback_screen.dart';

import 'package:quiz_app/src/constants/image_strings.dart';
import 'package:quiz_app/ui/auth/login_screen.dart';

int currentSelected = 0;

class PseudoCategory extends StatefulWidget {
  const PseudoCategory({super.key});

  @override
  State<PseudoCategory> createState() => _PseudoCategoryState();
}

class _PseudoCategoryState extends State<PseudoCategory> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Color.fromARGB(229, 20, 61, 184),
          backgroundColor: const Color.fromARGB(229, 20, 61, 184),
          title: const Text('Choose Language'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  curve: Curves.easeInOut,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        child: const Center(child: Text("CC")),
                      ),
                      const Text(
                        "Pseudo Code",
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 39, 53),
                            fontSize: 26),
                      ),
                    ],
                  )),
              const ListTile(
                selected: true,
                leading: Icon(Icons.my_library_books_outlined, size: 26),
                title: Text(
                  "Choose Language",
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => FeedbackScreen())));
                },
                leading: const Icon(Icons.feedback_outlined, size: 26),
                title: const Text("Feedback / Request Feature"),
              ),
              const ListTile(
                leading: Icon(Icons.star_border_purple500, size: 26),
                title: Text("Rate The App"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginScreen())));
                },
                leading: const Icon(Icons.logout, size: 26),
                title: const Text("Logout"),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 600,
              child: Stack(
                children: [
                  ListWheelScrollView.useDelegate(
                      diameterRatio: 1.5,
                      perspective: 0.0015,
                      itemExtent: 200,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          currentSelected = value;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 4,
                        builder: (context, index) {
                          return item(index, width);
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: width - 80,
              decoration: const BoxDecoration(),
              child: Row(
                children: [
                  const Text(
                    "Go to selected language",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 9, 126, 181),
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: FloatingActionButton(
                      elevation: 30,
                      splashColor: const Color.fromARGB(255, 49, 162, 211),
                      highlightElevation: 8.0,
                      backgroundColor: const Color.fromARGB(229, 20, 61, 184),
                      shape: const StadiumBorder(),
                      onPressed: () {
                        if (currentSelected == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const LoginScreen())));
                        } else if (currentSelected == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const CategoryC())));
                        } else if (currentSelected == 2) {
                        } else if (currentSelected == 3) {}
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget item(int index, double width) {
    Color color = const Color.fromARGB(255, 184, 177, 177);
    if (currentSelected == index) {
      color = const Color.fromARGB(229, 20, 61, 184);
    }
    return Column(
      children: [
        Container(
            height: 200,
            width: width - 80,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(color: color, blurRadius: 10, spreadRadius: 5)
                ]),
            child: Image.asset(
              pseudoCategoryImgList[index],
              fit: BoxFit.contain,
            )),
      ],
    );
  }
}
