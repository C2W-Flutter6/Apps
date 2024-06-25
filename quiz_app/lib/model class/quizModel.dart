//model class

class SingleQuestionModel {
  String question;
  List<String> options;
  int answerIndex;
  SingleQuestionModel({
    required this.question,
    required this.options,
    required this.answerIndex,
  });
}
