import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.startQuiz, {
    super.key,
  });

  //! inside the bracket named-arguments, outside the bracket positional-arguments.

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Opacity(
              opacity: 0.6,

              //* Image asset
              child: Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
              ),
            ),
            const SizedBox(
              height: 80,
            ),

            //* Tagline
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 218, 162, 224),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //* Submit button
            OutlinedButton.icon(
              onPressed: () {
                // Todo: Add start page button functionality
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                'Start Quiz',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
