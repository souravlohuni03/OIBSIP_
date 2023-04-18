// ignore_for_file: unused_import

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';

import 'package:flutter/material.dart';
import 'package:quiz_app/ui/posts/post_screen.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final ref = FirebaseDatabase.instance.ref('questions');

  List<String> questionTitlesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  defaultChild: const Center(child: Text('Loading..')),
                  itemBuilder: ((context, snapshot, animation, index) {
                    final title = snapshot.child('title').value.toString();
                    final options = snapshot.child('options').key.toString();

                    return ListTile(
                      title: Text(title + options),
                    );
                  })),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const PostScreen())));
            },
            child: FlipCard(
              autoFlipDuration: const Duration(milliseconds: 500),
              fill: Fill
                  .fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              side: CardSide.BACK, // The side to initially display.
              front: Container(
                height: 100,
                width: 100,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 99, 93, 93),
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  )
                ]),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const PostScreen())));
                    },
                    child: Image.asset(
                      'assets/images/c-logo.webp',
                    )),
              ),
              back: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 64, 115, 255),
                ),
                child: Container(
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
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
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 250,
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: Expanded(
                child: StreamBuilder(
              stream: ref.onValue,
              builder: (BuildContext context,
                  AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator(
                    strokeWidth: 3,
                  );
                } else {
                  Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list.clear();
                  list = map.values.toList();
                  return ListView.builder(
                    itemCount: snapshot.data!.snapshot.children.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(list[index]['title']),
                      );
                    },
                  );
                }
              },
            )),
          ),
        ],
      ),
    );
  }
}
