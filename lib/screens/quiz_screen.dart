import 'package:flutter/material.dart';
import '../widgets/custom_quiz_widget.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: CustomQuizWidget(
          question: '¿Cuál es el widget principal en Flutter para crear interfaces de usuario?',
          options: ['Container', 'Widget', 'BuildContext', 'MaterialApp'],
          correctAnswerIndex: 1,
        ),
      ),
    );
  }
}