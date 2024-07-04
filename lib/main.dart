import 'package:excuela_widget_master/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/interactive_progress_widget.dart';
import 'widgets/educational_card_widget.dart';
import 'widgets/custom_quiz_widget.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excuela Widget Master',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        hintColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excuela Widget Master'),
        elevation: 0,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            ProgressDemoScreen(),
            CardDemoScreen(),
            QuizDemoScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class ProgressDemoScreen extends StatelessWidget {
  const ProgressDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Interactive Progress Widget',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            const InteractiveProgressWidget(
              size: 200,
              color: Colors.blue,
              strokeWidth: 10,
            ),
            const SizedBox(height: 32),
            Text(
              'Customized Examples:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InteractiveProgressWidget(
                  size: 100,
                  color: Colors.red,
                  strokeWidth: 5,
                ),
                InteractiveProgressWidget(
                  size: 100,
                  color: Colors.green,
                  strokeWidth: 15,
                ),
                InteractiveProgressWidget(
                  size: 100,
                  color: Colors.orange,
                  strokeWidth: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardDemoScreen extends StatelessWidget {
  const CardDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Educational Card Widget',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            EducationalCardWidget(
              imageUrl: 'https://picsum.photos/seed/flutter/300/200',
              title: 'Learn Flutter',
              description:
                  'Discover the power of Flutter for cross-platform app development.',
              onLearnMore: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Learn More pressed')),
                );
              },
              onShare: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Share pressed')),
                );
              },
            ),
            const SizedBox(height: 32),
            Text(
              'Customized Example:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            EducationalCardWidget(
              imageUrl: 'https://picsum.photos/seed/dart/300/200',
              title: 'Dart Programming',
              description:
                  'Master the Dart programming language, the foundation of Flutter.',
              onLearnMore: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Learn More about Dart pressed')),
                );
              },
              onShare: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Share Dart info pressed')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuizDemoScreen extends StatelessWidget {
  const QuizDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Custom Quiz Widget',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            const CustomQuizWidget(
              question:
                  '¿Cuál es el widget principal en Flutter para crear interfaces de usuario?',
              options: ['Container', 'Widget', 'BuildContext', 'MaterialApp'],
              correctAnswerIndex: 1,
            ),
            const SizedBox(height: 32),
            Text(
              'Customized Example:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const CustomQuizWidget(
              question:
                  '¿Cuál de los siguientes NO es un tipo de widget en Flutter?',
              options: ['Stateless', 'Stateful', 'Dynamic', 'Inherited'],
              correctAnswerIndex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
