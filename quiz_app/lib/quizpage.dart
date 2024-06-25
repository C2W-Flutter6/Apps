//Complete QuizApp inluding Modal class

import 'package:flutter/material.dart';
import 'package:quiz_app/model class/quizModel.dart';

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
  Widget build(BuildContext context) {
    //IF questionScreenflag is true then display the quiz screen
    //ELSE display Results Screen
    return questionScreen
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: const Text(
                "QUIZ APP",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Questions: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${currentQuestionIndex + 1}/${allquestions.length}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  child: Text(
                    allquestions[currentQuestionIndex].question,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 380,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: selectedAnswerIndex != -1
                            ? checkAnswer(
                                optionIndex: 0,
                              )
                            : Colors.white),
                    onPressed: () {
                      if (selectedAnswerIndex == -1) {
                        setState(() {
                          selectedAnswerIndex = 0;
                        });
                      }
                    },
                    child: Text(
                      "a. ${allquestions[currentQuestionIndex].options[0]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 380,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: selectedAnswerIndex != -1
                            ? checkAnswer(
                                optionIndex: 1,
                              )
                            : Colors.white),
                    onPressed: () {
                      if (selectedAnswerIndex == -1) {
                        setState(() {
                          selectedAnswerIndex = 1;
                        });
                      }
                    },
                    child: Text(
                      "b. ${allquestions[currentQuestionIndex].options[1]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 380,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: selectedAnswerIndex != -1
                            ? checkAnswer(
                                optionIndex: 2,
                              )
                            : Colors.white),
                    onPressed: () {
                      if (selectedAnswerIndex == -1) {
                        setState(() {
                          selectedAnswerIndex = 2;
                        });
                      }
                    },
                    child: Text(
                      "c. ${allquestions[currentQuestionIndex].options[2]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 380,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: selectedAnswerIndex != -1
                            ? checkAnswer(
                                optionIndex: 3,
                              )
                            : Colors.white),
                    onPressed: () {
                      if (selectedAnswerIndex == -1) {
                        setState(() {
                          selectedAnswerIndex = 3;
                        });
                      }
                    },
                    child: Text(
                      "d. ${allquestions[currentQuestionIndex].options[3]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                currentPageValidate();
              },
              child: const Icon(
                Icons.forward,
                color: Colors.black,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: const Text(
                "QUIZ APP",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.network(
                  "src",
                  height: 300,
                ),
                const Center(
                  child: Text(
                    "Congratulations",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  "You have completed the Quiz",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      resetQuizVariables();
                    });
                  },
                  child: const Text(
                    "Restart Quiz",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
