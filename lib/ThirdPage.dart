import 'package:flutter/material.dart';
import 'not_Important/quiz.dart';
import 'not_Important/result.dart';

void main() => runApp(const ThirdPage());

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<ThirdPage> {
  final _questions = const [
    {
      'questionText': 'Which company owns the android?"',
      'Answers': [
        {'text': 'Google', 'score': 1},
        {'text': 'Apple', 'score': 0},
        {'text': 'Nokia', 'score': 0},
        {'text': 'Samsung', 'score': 0},
      ],
    },
    {
      'questionText': 'Which one is not the programming language?',
      'Answers': [
        {'text': 'Java', 'score': 0},
        {'text': 'Kotlin', 'score': 0},
        {'text': 'Notepad', 'score': 1},
        {'text': 'Python', 'score': 0},
      ],
    },
    {
      'questionText': 'Where you are watching this video?',
      'Answers': [
        {'text': 'Facebook', 'score': 0},
        {'text': 'Whatsapp', 'score': 0},
        {'text': 'Instagram', 'score': 0},
        {'text': 'Youtube', 'score': 1},
      ],
    },
    {
      'questionText': 'Which company owns the Apple?',
      'Answers': [
        {'text': 'Google', 'score': 0},
        {'text': 'Apple', 'score': 1},
        {'text': 'Nokia', 'score': 0},
        {'text': 'Samsung', 'score': 0},
      ],
    },
  ];
  // questions = []; // does not work if questions is a const

  var _questionIndex = 0;
  var _totalScore = 0;

  void _restQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('IQ Test'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _restQuiz),
      ),
    );
  }
}