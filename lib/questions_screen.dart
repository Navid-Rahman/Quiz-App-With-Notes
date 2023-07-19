import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/answer_button.dart';
import 'package:quiz_app_flutter/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
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
            ...currentQuestion.answers.map((item) {
              return AnswerButton(answerText: item, onPressed: () {});
            }),
            //? ... known or called as Spreading values(...)
          ],
        ),
      ),
    );
  }
}
