import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/c_programming.dart';
import 'package:quiz_app/ui/widgets/wait_screen.dart';

class AddingArrayData extends StatefulWidget {
  const AddingArrayData({super.key});

  @override
  State<AddingArrayData> createState() => _AddingArrayDataState();
}

bool _snapDataAdded = false;
late int length1;
List<Map<String, dynamic>> snapshotDataList = [];
List<Map<String, dynamic>> listOfOptions = [];

class _AddingArrayDataState extends State<AddingArrayData> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    // Start the timer
    final startTime = DateTime.now();

    await addSnapDataToList();
    if (mounted) {
      setState(() {
        _snapDataAdded = true;
        length1 = snapshotDataList.length;
      });
    }
    print(_snapDataAdded);
    // End the timer
    final endTime = DateTime.now();
    // Calculate the time taken
    final timeTaken = endTime.difference(startTime);

    // Print the time taken
    print('Time taken: ${timeTaken.inMilliseconds} milliseconds');
  }

//Retrieving C questions and options from firestore Database
  Future<void> addSnapDataToList() async {
    if (_snapDataAdded == false) {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('quizzes')
          .doc('C')
          .collection('topics')
          .doc('lEZ5eT7iNsilAkOmKAwY')
          .collection('Arrays')
          .get();

      List<Map<String, dynamic>> snapshotData =
          snapshot.docs.map((doc) => doc.data()).toList();
      if (snapshotDataList.isEmpty) {
        snapshotDataList.addAll(snapshotData);
      }
      print(snapshotData);
      // adding options for each questions in a list
      List<Map<String, dynamic>> optionsList = [];
      for (int i = 0; i < snapshot.docs.length; i++) {
        QuerySnapshot<Map<String, dynamic>> optionsnapshot =
            await FirebaseFirestore.instance
                .collection('quizzes')
                .doc('C')
                .collection('topics')
                .doc('lEZ5eT7iNsilAkOmKAwY')
                .collection('Arrays')
                .doc(snapshot.docs[i].id)
                .collection("options")
                .get();

        for (var element in optionsnapshot.docs) {
          optionsList.add(element.data());
        }
      }
      if (listOfOptions.isEmpty) {
        listOfOptions.addAll(optionsList);
      }
      // QuerySnapshot<Map<String, dynamic>> optionsSnapshot =
      //     await FirebaseFirestore.instance
      //         .collection('quizzes')
      //         .doc('C')
      //         .collection('topics')
      //         .doc('lEZ5eT7iNsilAkOmKAwY')
      //         .collection('Arrays')
      //         .doc('options')
      //         .get() as QuerySnapshot<Map<String, dynamic>>;

      // List<Map<String, dynamic>> optionsList =
      //     optionsSnapshot.docs.map((doc) => doc.data()).toList();
      // if (listOfOptions.isEmpty) {
      //   listOfOptions.addAll(optionsList);
      // }

      print("printing the Questions ");
      print(snapshotDataList);
      print("printing the List of options ");
      print(listOfOptions);

      print("printing the Questions ");
      print(snapshotDataList);
      print("printing the List of options ");
      print(listOfOptions);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            if (_snapDataAdded) {
              return const ArrayQuestions();
            } else {
              return const WaitScreen();
            }
          },
        );
      },
    );
  }
}
