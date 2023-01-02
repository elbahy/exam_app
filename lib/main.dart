// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(ExamApp());
}

int questionNumber = 0;
List<String> question = [
  "فصل الصيف ياتي بعد فصل الشتاء مباشرة",
  " الحمامة ليست من الطيور",
  "الاسد من الحيوانات المفترسة",
  "القاهرة هي عاصمة الجزائر",
  "سامسونج هي شركة لصناعة الهواتف",
  "جوجل تمتلك شركة يوتيوب",
  "اول من سافر الي القمر هو توماس اديسون",
];
List<bool> answer = [false, false, true, false, true, true, false];

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
                Image.asset("images/image-0${questionNumber + 1}.jpg"),
                SizedBox(height: 20),
                Text(
                  question[questionNumber],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (answer[questionNumber] == true) {
                    answerResult
                        .add(Icon(Icons.thumb_up_alt, color: Colors.green));
                  } else {
                    answerResult
                        .add(Icon(Icons.thumb_down_alt, color: Colors.red));
                  }
                  questionNumber++;
                });
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
                setState(() {
                  if (answer[questionNumber] == false) {
                    answerResult
                        .add(Icon(Icons.thumb_up_alt, color: Colors.green));
                  } else {
                    answerResult
                        .add(Icon(Icons.thumb_down_alt, color: Colors.red));
                  }
                  questionNumber++;
                });
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
