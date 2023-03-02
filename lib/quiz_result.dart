import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final int score;
  final Function onRestartQuiz;


  const Result({super.key,  required this.score, required this.onRestartQuiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('Quiz Completed!!!',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),),

          const SizedBox( height: 60),

            const Text('Your Score',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),),
            const SizedBox(height: 5),

            Text('$score/3',
             style: const TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.w900
             ),),

            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: (){} ,//onRestartQuiz(),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange)
                ),
                child: const Text('Retake Quiz'))
          ],
        ),
      ),
    );
  }
}


