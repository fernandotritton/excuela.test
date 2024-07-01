import 'package:flutter/material.dart';

class CustomQuizWidget extends StatefulWidget {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const CustomQuizWidget({super.key, 
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomQuizWidgetState createState() => _CustomQuizWidgetState();
}

class _CustomQuizWidgetState extends State<CustomQuizWidget> {
  int? selectedAnswerIndex;
  bool showResult = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.question,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...widget.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ElevatedButton(
                  onPressed: showResult ? null : () => _selectAnswer(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getButtonColor(index),
                  ),
                  child: Text(option),
                ),
              );
            }),
            const SizedBox(height: 16),
            if (showResult)
              Text(
                selectedAnswerIndex == widget.correctAnswerIndex
                    ? '¡Correcto!'
                    : 'Incorrecto. La respuesta correcta era: ${widget.options[widget.correctAnswerIndex]}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selectedAnswerIndex == widget.correctAnswerIndex
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            if (!showResult)
              ElevatedButton(
                onPressed: selectedAnswerIndex != null ? _submitAnswer : null,
                child: const Text('Enviar Respuesta'),
              ),
          ],
        ),
      ),
    );
  }

  void _selectAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
  }

  void _submitAnswer() {
    setState(() {
      showResult = true;
    });
  }

  Color _getButtonColor(int index) {
    if (!showResult) {
      return selectedAnswerIndex == index ? Colors.blue : Colors.grey;
    } else {
      if (index == widget.correctAnswerIndex) {
        return Colors.green;
      } else if (index == selectedAnswerIndex) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }
  }
}