import 'question.dart';

class AppBrain {
  List<Question> _question = [
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

  int _questionNumber = 0;

  void nextNumber() {
    if (_questionNumber < _question.length - 1) {
      _questionNumber++;
    }
  }

  String getText() {
    return _question[_questionNumber].text;
  }

  String getImage() {
    return _question[_questionNumber].image;
  }

  bool getAnswer() {
    return _question[_questionNumber].answer;
  }
}
