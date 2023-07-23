// Importing necessary libraries and packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/questions_summary.dart';

// The ResultScreen class, which is a StatelessWidget
class ResultScreen extends StatelessWidget {
  // Constructor for the ResultScreen
  const ResultScreen({
    Key? key,
    required this.chosenAnswers,
  }) : super(key: key);

  // List to store the user's chosen answers for each question
  final List<String> chosenAnswers;

  // Method to generate the summary data for each question
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      // Create a map with question index, question text, correct answer, and user's chosen answer
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_chosen_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  // Build method to create the UI for the ResultScreen
  @override
  Widget build(BuildContext context) {
    // Generate the summary data for each question
    final summaryData = getSummaryData();

    // Calculate the number of total questions and number of correct questions
    final numberOfTotalQuestion = questions.length;
    final numberOfCorrectQuestion = summaryData.where((data) {
      return data['user_chosen_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the result message with the number of correct answers
              Text(
                'You answered $numberOfCorrectQuestion out of $numberOfTotalQuestion questions correctly!',
                style: const TextStyle(
                    //* Add text styles for this.
                    // You can add custom styles for the result message here.
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Display the question summary using the QuestionSummary widget
              QuestionSummary(
                summaryData,
              ),
              const SizedBox(
                height: 30,
              ),
              // Button to restart the quiz
              TextButton.icon(
                onPressed: () {
                  //! Add functionality for the Restart Quiz Button.
                  // You can add the logic to restart the quiz when this button is pressed.
                  // For example, you can reset the chosenAnswers list and navigate back to the StartScreen.
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.restart_alt),
                label: Text(
                  'Restart Quiz!',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
