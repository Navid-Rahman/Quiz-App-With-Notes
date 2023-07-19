// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizQuestion {
  QuizQuestion(
    this.question,
    this.answers,
  );

  final List<String> answers;
  final String question;

  List<String> getShuffledAnswers() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}
