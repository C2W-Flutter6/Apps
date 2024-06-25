//Complete QuizApp inluding Modal class

import 'package:flutter/material.dart';
//import 'package:quiz_app/model class/quizModel.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State createState() => _QuizPageState();
}

class _QuizPageState extends State {
  //List of questions
  List<dynamic> allquestions = [
    SingleQuestionModel(
      question: "Choose Option 1",
      options: ["Option 1", "Option 2", "Option 3", "Option 4"],
      answerIndex: 0,
    ),
    SingleQuestionModel(
      question: "Choose Option 2",
      options: ["Option 1", "Option 2", "Option 3", "Option 4"],
      answerIndex: 1,
    ),
    SingleQuestionModel(
      question: "Choose Option 3",
      options: ["Option 1", "Option 2", "Option 3", "Option 4"],
      answerIndex: 2,
    ),
    SingleQuestionModel(
      question: "Choose Option 4",
      options: ["Option 1", "Option 2", "Option 3", "Option 4"],
      answerIndex: 3,
    ),
  ];

  int currentQuestionIndex = 0;
  int noOfCorrect = 0;
  int selectedAnswerIndex = -1;
  bool questionScreen = true;
  bool isAnswered = false;

  void resetQuizVariables() {
    currentQuestionIndex = 0;
    noOfCorrect = 0;
    selectedAnswerIndex = -1;
    questionScreen = true;
    isAnswered = false;
  }

  void currentPageValidate() {
    //Increment no of questions ticked
    if (selectedAnswerIndex == allquestions[currentQuestionIndex].answerIndex) {
      noOfCorrect = noOfCorrect + 1;
    }

    //if no answer is selected
    if (selectedAnswerIndex == -1) {
      return;
    }

    //if all the questions are attempted
    if (currentQuestionIndex == allquestions.length - 1) {
      setState(() {
        questionScreen = false;
      });
      return;
    }
    selectedAnswerIndex = -1;

    //Increment question Index
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  Color checkAnswer({required int optionIndex}) {
    if (optionIndex == selectedAnswerIndex) {
      if (allquestions[currentQuestionIndex].answerIndex ==
          selectedAnswerIndex) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else if (optionIndex == allquestions[currentQuestionIndex].answerIndex) {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {}
}
