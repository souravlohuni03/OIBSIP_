import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controller/question_time_controller.dart';
import 'package:quiz_app/Category/category_c.dart';

import 'package:quiz_app/widgets/timer_bar.dart';

import 'adding_array_data.dart';

List<String> keysList = [];

class ArrayQuestions extends StatefulWidget {
  const ArrayQuestions({super.key});

  @override
  State<ArrayQuestions> createState() => _ArrayQuestionsScreenState();
}

class _ArrayQuestionsScreenState extends State<ArrayQuestions> {
  @override
  void initState() {
    super.initState();
    index = 0;
  }

  late String decodedString;
  static bool alreadyPressed = false;
  int index = 0;
  int score = 0;
  Color wrongAns = const Color.fromARGB(255, 217, 86, 86);
  Color rightAns = const Color.fromARGB(255, 64, 147, 67);
  Color onPressOptionColor0 = const Color.fromARGB(255, 255, 255, 255);
  Color onPressOptionColor1 = const Color.fromARGB(255, 255, 255, 255);
  Color onPressOptionColor2 = const Color.fromARGB(255, 255, 255, 255);
  Color onPressOptionColor3 = const Color.fromARGB(255, 255, 255, 255);

  late List<String> keysList = listOfOptions[index].keys.toList();

  void optionChangeColorToOriginal() {
    onPressOptionColor0 = const Color.fromARGB(255, 255, 255, 255);
    onPressOptionColor1 = const Color.fromARGB(255, 255, 255, 255);
    onPressOptionColor2 = const Color.fromARGB(255, 255, 255, 255);
    onPressOptionColor3 = const Color.fromARGB(255, 255, 255, 255);
  }

//this function will convert question from json questionlist to question
  String addQues() {
    String firebaseString = snapshotDataList[index]['question'];
    String escapedString = firebaseString.replaceAll('"', r'\"');
    // escapedString = firebaseString.replaceAll('var', r'value');
    decodedString = jsonDecode('"$escapedString"');

    return decodedString;
  }

//this function will show us the next question
  void nextQuestion() {
    setState(() {
      alreadyPressed = false;
      if (index == listOfOptions.length - 1) {
        keysList.clear();
        index = 0;
        keysList = listOfOptions[index].keys.toList();

        showDialog(
          barrierColor: const Color.fromARGB(215, 32, 26, 37),
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              elevation: 50,
              title:
                  const Text('Congratulations.\nYou have reached to the End.'),
              content: Text('Your Score is $score'),
              actions: [
                TextButton(
                  child: const Text('Try Again'),
                  onPressed: () {
                    setState(() {
                      index = 0;
                      score = 0;
                      alreadyPressed = false;

                      optionChangeColorToOriginal();
                    });
                    if (mounted) {
                      Get.find<QuestionTimeController>().resetAnimation();
                    }
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text('Finish'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const CategoryC())));
                  },
                ),
              ],
            );
          },
        );
      } else {
        if (mounted) {
          Get.find<QuestionTimeController>().resetAnimationController();
        }
        index++;
        keysList.clear();
        keysList = listOfOptions[index].keys.toList();
        optionChangeColorToOriginal();
      }
    });
  }

  void previousQuestion() {
    if (index > 0) {
      setState(() {
        index--;
        keysList.clear();
        keysList = listOfOptions[index].keys.toList();
        alreadyPressed = true;
        optionChangeColorToOriginal();
        if (mounted) Get.find<QuestionTimeController>().resetAnimation();
      });
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const CategoryC())));
    }
  }

//function to check if the options is right.....................................
  bool checkAnswer(String keyList) {
    bool ans = false;
    if (listOfOptions[index][keyList] == "true") {
      ans = true;
    }
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ques ${index + 1}/ $length1"),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              previousQuestion();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: nextQuestion,
              child: Text(
                'Score : $score ',
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
          backgroundColor: const Color.fromARGB(229, 20, 61, 184),
        ),
        body: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TimeBar(),
              ),

              //Displaying Questions

              SizedBox(
                height: 380,
                width: MediaQuery.of(context).size.width,
                child: SyntaxView(
                  code: addQues(),

                  syntax: Syntax.C, // Language
                  syntaxTheme: SyntaxTheme.ayuDark(), // Theme
                  fontSize: 13.0, // Font size
                  withZoom: true, // Enable/Disable zoom icon controls
                  withLinesCount: true, // Enable/Disable line number
                  expanded: true,
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              // Displaying options of their Questions
              SizedBox(
                height: 230,
                child: Card(
                  child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      itemExtent: 55,
                      children: <Widget>[
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: onPressOptionColor0,
                          title: Text(
                            keysList[0],
                          ),
                          onTap: () {
                            bool ans = checkAnswer(keysList[0]);

                            if (ans) {
                              setState(() {
                                onPressOptionColor0 = rightAns;
                                if (!alreadyPressed) {
                                  score++;
                                }
                                alreadyPressed = true;
                              });
                            } else {
                              setState(() {
                                onPressOptionColor0 = wrongAns;
                                alreadyPressed = true;
                              });
                            }
                            // Add functionality for option 1
                          },
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: onPressOptionColor1,
                          title: Text(
                            keysList[1],
                          ),
                          onTap: () {
                            bool ans = checkAnswer(keysList[1]);

                            if (ans) {
                              setState(() {
                                onPressOptionColor1 = rightAns;
                                if (!alreadyPressed) {
                                  score++;
                                }
                                alreadyPressed = true;
                              });
                            } else {
                              setState(() {
                                onPressOptionColor1 = wrongAns;
                                alreadyPressed = true;
                              });
                            }
                          },
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: onPressOptionColor2,
                          title: Text(
                            keysList[2],
                          ),
                          onTap: () {
                            bool ans = checkAnswer(keysList[2]);

                            if (ans) {
                              setState(() {
                                onPressOptionColor2 = rightAns;
                                if (!alreadyPressed) {
                                  score++;
                                }
                                alreadyPressed = true;
                              });
                            } else {
                              setState(() {
                                onPressOptionColor2 = wrongAns;
                                alreadyPressed = true;
                              });
                            }
                          },
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: onPressOptionColor3,
                          title: Text(
                            keysList[3],
                            maxLines: 2,
                          ),
                          onTap: () {
                            bool ans = checkAnswer(keysList[3]);

                            if (ans) {
                              setState(() {
                                onPressOptionColor3 = rightAns;
                                if (!alreadyPressed) {
                                  score++;
                                }
                                alreadyPressed = true;
                              });
                            } else {
                              setState(() {
                                onPressOptionColor3 = wrongAns;
                                alreadyPressed = true;
                              });
                            }
                          },
                        ),
                      ]),
                ),
              ),

              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: nextQuestion,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(229, 20, 61, 184))),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: const [Icon(Icons.touch_app), Text('Next')],
                    ),
                  ),
                ),
              ),

              //displaying score
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Explanation',
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 118, 154),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
