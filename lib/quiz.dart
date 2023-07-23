// Importing necessary libraries and packages
import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/questions_screen.dart';
import 'package:quiz_app_flutter/result_screen.dart';
import 'package:quiz_app_flutter/start_screen.dart';

// The Quiz class, which is a StatefulWidget
class Quiz extends StatefulWidget {
  // Constructor for the Quiz
  const Quiz({super.key});

  // Overriding the createState method to create the state for this StatefulWidget
  @override
  State<Quiz> createState() => _QuizState();
}

// The state class for the Quiz
class _QuizState extends State<Quiz> {
  // Variable to hold the active screen widget
  Widget? activeScreen;

  // List to store the selected answers for each question
  List<String> selectedAnswers = [];

  // initState method to initialize the state
  @override
  void initState() {
    // Set the activeScreen to StartScreen initially
    activeScreen = StartScreen(switchScreen);
    super.initState();

    //! This initState will run before the build method.
    //! initState will be executed first by Flutter.
  }

  // Method to switch to the QuestionsScreen when the user taps the "Start" button
  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswers,
      );
    });
  }

  // Method to handle the selection of an answer in the QuestionsScreen
  void chooseAnswers(String answer) {
    // Add the selected answer to the selectedAnswers list
    selectedAnswers.add(answer);

    // Check if all questions have been answered
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // If all questions have been answered, switch to the ResultScreen
        activeScreen = ResultScreen(
          chosenAnswers: selectedAnswers,
        );
      });
    }
  }

  // Build method to create the UI for the Quiz
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the debugShowCheckedModeBanner to false
      debugShowCheckedModeBanner: false,

      // Define the home as a Scaffold with a gradient background and the activeScreen as the body
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
