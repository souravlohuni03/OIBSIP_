import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/c_programming.dart';
import 'package:quiz_app/Category/category_c.dart';
import 'package:quiz_app/ui/posts/add_posts.dart';
import 'package:quiz_app/ui/posts/pseudo_category.dart';

import 'package:quiz_app/widgets/timer_bar.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 20, 76),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(0, 120, 14, 14),
            statusBarIconBrightness: Brightness.light),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'languages',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.account_circle_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 130),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CategoryC())));
                    },
                    child: Container(
                        height: 150,
                        width: 130,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 99, 93, 93),
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              )
                            ]),
                        child: Image.asset(
                          'assets/images/c-logo.webp',
                        )),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ArrayQuestions())));
                    },
                    child: Container(
                        height: 150,
                        width: 130,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 99, 93, 93),
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              )
                            ]),
                        child: Image.asset(
                          'assets/images/javalogo.webp',
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const TimeBar())));
                    },
                    child: Container(
                        height: 150,
                        width: 130,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 99, 93, 93),
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              )
                            ]),
                        child: Image.asset(
                          'assets/images/pythlogo.webp',
                        )),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                      height: 150,
                      width: 130,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 99, 93, 93),
                          blurRadius: 10,
                          offset: Offset(5, 5),
                        )
                      ]),
                      child: Image.asset(
                        'assets/images/jslogo.webp',
                        fit: BoxFit.cover,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print("Tapeed on latest feature");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => PseudoCategory())));
                },
                child: Container(
                    height: 20,
                    width: 130,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 99, 93, 93),
                        blurRadius: 10,
                        offset: Offset(5, 5),
                      )
                    ]),
                    child: const Text("Testing features ")),
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FeedbackScreen()));
          },
          child: const Icon(Icons.bar_chart_outlined)),
    );
  }
}
