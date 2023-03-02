import 'package:flutter/material.dart';
import 'quiz_screen.dart';

void main() => runApp(const MaterialApp(
    home: Home(),
));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuizScreen();
  }
}
