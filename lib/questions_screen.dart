import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/answer_button.dart';
import 'package:quiz_app_flutter/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerOfQuestion() {
    setState(() {
      // currentQuestionIndex = currentQuestionIndex + 1;
      // currentQuestionIndex += 1;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                //fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map((item) {
              //? Map doesn't change the original lists
              //? But Shuffle does change the original lists

              return AnswerButton(
                answerText: item,
                onPressed: answerOfQuestion,

                //? Calling a function with parenthesis: When you call a function with parentheses, you are executing the function and passing any necessary arguments.
                //? Calling a function without parenthesis: When you call a function without parentheses, you are referring to the function itself, not executing it.
              );

              //? ... known or called as Spreading values(...)
              //? The values should be added as a iterals to a newer list.
            }),
          ],
        ),
      ),
    );
  }
}
