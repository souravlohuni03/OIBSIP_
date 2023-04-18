import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FeedbackScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();

  FeedbackScreen({super.key});

  sendMail(String subject, String body, String recipientmail) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipientmail],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback / Request a feature"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Your Feedback is Important to Us: \n Help Us Improve with Your Valuable Input",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: subject,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Enter Subject",
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: TextFormField(
                      maxLines: 8,
                      controller: body,
                      decoration: const InputDecoration(
                          hintMaxLines: 250,
                          hintText:
                              "Please provide Your feedback / request feature",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _key.currentState!.save();
                        sendMail(subject.text, body.text,
                            "sourav03lohuni@gmail.com");
                      },
                      child: const Text("Submit"))
                ],
              ),
            ),
          ),
          const Text(
            " \"If your feature is deemed valuable by the app,\n it has the potential to earn you recognition and rewards. \"",
            style: TextStyle(
                color: Color.fromARGB(255, 6, 60, 148),
                fontSize: 15,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
