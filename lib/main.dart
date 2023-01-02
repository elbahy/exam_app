// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(ExamApp());
}

int questionNumber = 0;
List<String> question = [
  "فصل الصيف ياتي بعد فصل الشتاء مباشرة",
  " الحمامة ليست من الطيور",
  "الاسد من الحيوانات المفترسة"
];

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Icon(
              Icons.thumb_up_alt,
              color: Colors.green,
            ),
            Icon(
              Icons.thumb_down_alt,
              color: Colors.red,
            )
          ]),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Image.asset("images/image-04.jpg"),
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
              onPressed: () {},
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
