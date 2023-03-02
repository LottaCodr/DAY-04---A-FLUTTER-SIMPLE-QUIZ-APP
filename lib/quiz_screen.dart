import 'package:flutter/material.dart';
import 'dart:async';
import 'quiz_result.dart';
import 'quiz_questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  Timer _timer = Timer.periodic(const Duration(seconds: 0), (timer) { });
  int timeRemaining = 10;


final  List<Question> questions = [
    Question( "What is the capital of France?", ['Paris', 'Berlin', 'Rome', 'Madrid'], 'Paris'),
    Question("What is the highest mountain in the world?", ['Mount Everest', 'K2', 'Malu', 'Kanchenjunga'], 'Mount Everest'),
    Question("What is the smallest country in the world by area?" , ['Monaco', 'Nehru', 'San Marino', 'Vatican City'], ' Vatican City')
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  //Setting the timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeRemaining > 0) {
          timeRemaining--;
        } else {
          _timer.cancel();
          answerQuestions('');
        }
      });
    });
  }

    void answerQuestions(String answer) {
      if (answer == questions[currentQuestionIndex].correctAnswer) {
        setState(() {
          score++;
        });
      }

      setState(() {
        timeRemaining = 10;
        currentQuestionIndex++;
        if (currentQuestionIndex >= questions.length) {
          _timer.cancel();
        } else {
          startTimer();
        }
      });
    }

      //setting the restart button
      void restartQuiz() {
        setState(() {
          currentQuestionIndex = 0;
          score = 0;
          timeRemaining = 10;
          startTimer();
        });

      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.orange,
        title: const Text('Quiz App'),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),

      body: Center(

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: currentQuestionIndex < questions.length
                ? QuizQuestions(
                question: questions[currentQuestionIndex],
                onAnswerSelected: answerQuestions,
                timeRemaining: timeRemaining)
                : Result(
                score: score,
                onRestartQuiz: restartQuiz),
          ),

      ),
    );
  }

}
