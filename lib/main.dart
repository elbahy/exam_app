// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exam_app/app_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExamApp());
}

int questionNumber = 0;
AppBrain appBrain = AppBrain();

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Exam 2022"),
            backgroundColor: Color.fromARGB(255, 68, 148, 214),
          ),
          body: ExamPage()),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Icon> answerResult = [];

  void checkAnswer(bool a) {
    setState(() {
      if (appBrain.getAnswer() == a) {
        answerResult.add(Icon(Icons.thumb_up_alt, color: Colors.green));
      } else {
        answerResult.add(Icon(Icons.thumb_down_alt, color: Colors.red));
      }
      appBrain.nextNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: answerResult),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Image.asset(appBrain.getImage()),
                SizedBox(height: 20),
                Text(
                  appBrain.getText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                "صح",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[400])),
              child: Text(
                "خطــأ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
