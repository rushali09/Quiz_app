import 'package:flutter/material.dart';
import 'quiz_Brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBrain quizBrain =QuizBrain();

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Quiz(),
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  Quiz({Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<Icon> scoreKeeper=[];
  
  
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getCorrectAnswer();

   setState(() {
     
   
    if(quizBrain.isFinished() == true){
      
      Alert(
        context: context,
        title:'Finished',
        desc: "You have reached the end of the quiz",).show();

    

    quizBrain.reset();

    scoreKeeper=[];
    }
    else{
      if (userPickedAnswer == correctAnswer){
        scoreKeeper.add(Icon(Icons.check,color:Colors.green),);
      
      }
      else{
        scoreKeeper.add(Icon(Icons.close,color:Colors.red),);
      }

    }

    quizBrain.nextquestion();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
                color: Colors.pink,
                child: Text('True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
            )
          ),
        ),

         Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
                color: Colors.purple,
                child: Text('False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
            )
          ),
        ),
        Row(
         children: 
           scoreKeeper,
         
        )
      ],
    );

  
  }
}
