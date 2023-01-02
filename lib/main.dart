// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExamApp());
}

int questionNumber = 0;

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
    if (question[questionNumber].answer == a) {
      answerResult.add(Icon(Icons.thumb_up_alt, color: Colors.green));
    } else {
      answerResult.add(Icon(Icons.thumb_down_alt, color: Colors.red));
    }
  }

  List<Question> question = [
    Question(
        "فصل الصيف ياتي بعد فصل الشتاء مباشرة", "images/image-01.jpg", false),
    Question(" الحمامة ليست من الطيور", "images/image-02.jpg", false),
    Question("الاسد من الحيوانات المفترسة", "images/image-03.jpg", true),
    Question("القاهرة هي عاصمة الجزائر", "images/image-04.jpg", false),
    Question("سامسونج هي شركة لصناعة الهواتف", "images/image-05.jpg", true),
    Question("جوجل تمتلك شركة يوتيوب", "images/image-06.jpg", true),
    Question(
        "اول من سافر الي القمر هو توماس اديسون", "images/image-07.jpg", false),
  ];
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
                Image.asset(question[questionNumber].image),
                SizedBox(height: 20),
                Text(
                  question[questionNumber].text,
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
                  checkAnswer(true);
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
                  checkAnswer(false);
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
