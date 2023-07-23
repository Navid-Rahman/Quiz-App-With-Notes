// Importing necessary libraries and packages
import 'package:flutter/material.dart';

// The QuestionSummary class, which is a StatelessWidget
class QuestionSummary extends StatelessWidget {
  // Constructor for the QuestionSummary
  const QuestionSummary(
    this.summaryData, {
    Key? key,
  }) : super(key: key);

  // List to hold the summary data for each question
  final List<Map<String, Object>> summaryData;

  // Build method to create the UI for the QuestionSummary
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        // SingleChildScrollView allows scrolling when the content exceeds the available height
        child: Column(
          // Create a column with children for each question summary data
          children: summaryData.map((data) {
            // Use the map function to convert each entry in the summaryData list to a widget
            return Row(
              // Create a row for each question summary data
              children: [
                // Display the question index
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                ),
                Expanded(
                  // Expanded widget to make the column take the remaining horizontal space
                  child: Column(
                    // Create a column for the question, user's chosen answer, and correct answer
                    children: [
                      // Display the question text
                      Text(data['question'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      // Display the user's chosen answer
                      Text(data['user_chosen_answer'] as String),
                      // Display the correct answer
                      Text(data['correct_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
