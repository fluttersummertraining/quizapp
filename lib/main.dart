import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //String question = "What is 2+2?";
  List<String> questions = [
    "What is 2+2?",
    "What is 7*5?",
    "What is 20% of 40?",
  ];

  List<List<String>> optionBank = [
    ["4", "5", "6", "7"],
    ["34", "35", "36", "37"],
    ["5", "6", "7", "8"]
  ];

  List<String> answers = [
    "A",
    "B",
    "D",
  ];

  int currentScore = 0;
  int attemptedQuestions = 0;

  int index = 0;
  //String option1 = "4";
  //String option2 = "5";
  /*void submitOption() {
    setState(() {
      if (index < questions.length - 1) index++;
    });
    if(optionId == answers[index])
      currentScore++;
    attemptedQuestions++;
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Score: ${currentScore}/${attemptedQuestions}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      child: Text(
                        questions[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    optionBox(
                        onTap: () {
                          setState(() {
                            if ("A" == answers[index]) currentScore++;
                            if (index < questions.length - 1) index++;
                            attemptedQuestions++;
                          });
                        },
                        optionId: "A",
                        option: optionBank[index][0]),
                    SizedBox(
                      width: 10,
                    ),
                    optionBox(
                        onTap: () {
                          setState(() {
                            if ("B" == answers[index]) currentScore++;
                            if (index < questions.length - 1) index++;
                            attemptedQuestions++;
                          });
                        },
                        optionId: "B",
                        option: optionBank[index][1]),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    optionBox(
                        onTap: () {
                          setState(() {
                            if ("C" == answers[index]) currentScore++;
                            if (index < questions.length - 1) index++;

                            attemptedQuestions++;
                          });
                        },
                        optionId: "C",
                        option: optionBank[index][2]),
                    SizedBox(
                      width: 10,
                    ),
                    optionBox(
                        onTap: () {
                          setState(() {
                            if ("D" == answers[index]) currentScore++;
                            if (index < questions.length - 1) index++;

                            attemptedQuestions++;
                          });
                        },
                        optionId: "D",
                        option: optionBank[index][3]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget optionBox(
    {required void onTap(), required String optionId, required String option}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                "${optionId}. ${option}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
  );
}
