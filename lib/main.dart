import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 7},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favourite actor?',
      'answers': [
        {'text': 'Vicky', 'score': 7},
        {'text': 'Pratik', 'score': 2},
        {'text': 'Akshay', 'score': 5},
        {'text': 'Raj', 'score': 6},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //var b = true;

    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    //print(questionIndex);
    //print('Answer Chosen!');
    if (_questionIndex < _questions.length) {
      print('We have more questions for you!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                _questions,
                _answerQuestion,
                _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
