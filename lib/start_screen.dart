// Importing necessary libraries and packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// The StartScreen class, which is a StatelessWidget
class StartScreen extends StatelessWidget {
  // Constructor for the StartScreen
  const StartScreen(
    this.startQuiz, {
    super.key,
  });

  // Function callback to start the quiz
  final void Function() startQuiz;

  // Build method to create the UI for the StartScreen
  @override
  Widget build(BuildContext context) {
    return Container(
      // Container with a gradient background
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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Opacity widget to control the opacity of the image
            Opacity(
              opacity: 0.6,

              // Image asset for the quiz logo
              child: Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
              ),
            ),
            const SizedBox(
              height: 80,
            ),

            // Tagline text for the quiz
            Text(
              'Learn Flutter the fun way!',
              style: GoogleFonts.satisfy(
                fontSize: 26,
                color: const Color.fromARGB(255, 237, 206, 240),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // Submit button to start the quiz
            OutlinedButton.icon(
              onPressed: () {
                // Call the startQuiz function when the button is pressed
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt_sharp),
              label: Text(
                'Start Quiz',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
