import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

 Quiz quiz = Quiz([Question(question:"Fernando é legal?",answer: true),
                  Question(question:"O sobre nome de Fernando é Neto?",answer: false)
 ]);




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getStringQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  quiz.checkAnswer(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  quiz.checkAnswer(false);
                });
              },
            ),
          ),
        ),
        Row(
          children: quiz.getIcons(),
        ),
      ],
    );
  }
}

class Quiz{
  int index = 0;
  List<Icon> icons = [];
  final List<Question> questions;

  Quiz(this.questions): assert(questions!= null);

  Question getQuestion(){
    return questions[index];
  }

  String getStringQuestion(){
    return getQuestion().getQuestion();
  }

  List<Icon> getIcons(){
    return icons;
  }

  void checkAnswer(bool answer){
    icons.add(getQuestion().getIcon(answer));
    nextQuestion();
  }
  void nextQuestion(){
    if(index < questions.length-1){
      index++;
    }else{
      //TODO: last page
    }
  }
}

class Question{
  final String question;
  final bool answer;
  const Question({this.question, this.answer})
      :assert(question != null),
       assert(answer != null);

  String getQuestion(){
    return question;
  }

  bool getAnswer(){
    return answer;
  }

  Icon getIcon(bool answer){
    if(this.answer == answer){
      return Icon(Icons.check, color: Colors.green,);
    }else{
      return Icon(Icons.close, color: Colors.red,);
    }
  }
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
