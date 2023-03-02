import 'package:flutter/material.dart';

class Question {
  final String questionText;
  final List<String> answersOptions;
  final String correctAnswer;

  Question (
   this.questionText,
   this.answersOptions,
   this.correctAnswer
  );

}

class QuizQuestions extends StatelessWidget {
  final Question question;
  final Function(String) onAnswerSelected;
  final int timeRemaining;

  const QuizQuestions({super.key,
   required this.question,
    required this.onAnswerSelected,
    required this.timeRemaining
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(question.questionText,
          style: const TextStyle(
            fontSize: 24),
          ),

          const SizedBox(height: 24),
          ...question.answersOptions.map(
              (option) => ElevatedButton(
                  onPressed: (){
                    onAnswerSelected(option);
                  },
                  child: Text(option))
          ),
            //2nd Option for displaying the Answer Options
          // ListView.builder(
          //     itemCount: question.answersOptions.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       final option = question.answersOptions[index];
          //       return Row(
          //         children: [
          //           Center(
          //             child: ElevatedButton(
          //                 onPressed: () {
          //                   onAnswerSelected(option);
          //                 },
          //                 child: Text(option)),
          //           ),
          //         ],
          //       );
          //     }),

          const SizedBox(height: 24),
          Text('Time remaining is: $timeRemaining seconds',
          style: const TextStyle(
            fontSize: 16
          ),)
        ],
      ),
    );
  }
}
