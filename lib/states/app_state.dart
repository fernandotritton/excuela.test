import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  int _quizScore = 0;

  int get quizScore => _quizScore;

  void incrementScore() {
    _quizScore++;
    notifyListeners();
  }

  void resetScore() {
    _quizScore = 0;
    notifyListeners();
  }
}