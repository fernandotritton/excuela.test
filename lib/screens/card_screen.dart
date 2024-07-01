import 'package:flutter/material.dart';
import '../widgets/educational_card_widget.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: EducationalCardWidget(
          imageUrl: 'https://example.com/flutter-image.jpg',
          title: 'Learn Flutter',
          description: 'Discover the power of Flutter for cross-platform app development.',
          onLearnMore: () {
            // Implementar acción para "Learn More"
          },
          onShare: () {
            // Implementar acción para compartir
          },
        ),
      ),
    );
  }
}