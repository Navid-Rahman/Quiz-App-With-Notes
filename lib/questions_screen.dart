// Importing necessary libraries and packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_flutter/answer_button.dart';
import 'package:quiz_app_flutter/data/questions.dart';

// The QuestionsScreen class, which is a StatefulWidget
class QuestionsScreen extends StatefulWidget {
  // Constructor for the QuestionsScreen
  const QuestionsScreen({
    Key? key,
    required this.onSelectAnswer,
  }) : super(key: key);

  // Callback function that will be called when an answer is selected
  final void Function(String answer) onSelectAnswer;

  // Overriding the createState method to create the state for this StatefulWidget
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

// The state class for the QuestionsScreen
class _QuestionsScreenState extends State<QuestionsScreen> {
  // Variable to keep track of the current question index
  var currentQuestionIndex = 0;

  // Method to handle the selection of an answer
  void answerOfQuestion(String selectedAnswer) {
    // Call the onSelectAnswer callback with the selected answer
    widget.onSelectAnswer(selectedAnswer);

    // Update the state to move to the next question
    setState(() {
      currentQuestionIndex++;
    });
  }

  // Build method to create the UI for the QuestionsScreen
  @override
  Widget build(BuildContext context) {
    // Get the current question from the list of questions using the currentQuestionIndex
    final currentQuestion = questions[currentQuestionIndex];

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget to display the current question text
              Text(
                currentQuestion.question,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 216, 191, 245),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Use the spread operator (...) to create a list of AnswerButton widgets for each shuffled answer
              ...currentQuestion.getShuffledAnswers().map(
                (item) {
                  // Create an AnswerButton for each answer item
                  return AnswerButton(
                    answerText: item,
                    onPressed: () {
                      // When an answer is pressed, call the answerOfQuestion method with the selected answer
                      answerOfQuestion(item);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
