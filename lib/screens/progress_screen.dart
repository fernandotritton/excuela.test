import 'package:flutter/material.dart';
import '../widgets/interactive_progress_widget.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: InteractiveProgressWidget(),
    );
  }
}
