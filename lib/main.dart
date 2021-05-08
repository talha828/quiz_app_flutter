import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'package:alert/alert.dart';
QuestionBank questionBank= new QuestionBank();
void main() {
  runApp(MyApp(),);
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      title: Center(child: Text('Quiz App',style: TextStyle(
          fontSize: 26,
      ),)),

      ),
     body: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int num=0;
  int score=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Column(
        children: [
         Container(height: 130,
         child: Center(
           child: Text(

             'My Score: $score/10',style:TextStyle(
             fontSize: 40,

             color: Colors.white
           ),
           ),
         ),
         ),
          Center(
            child: Container(
              color: Colors.black38,
              height: 150,
              width: 400,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(15),
              child: Center(child: Text(questionBank.questionwala[num].questiontext,
              style:TextStyle(
                color: Colors.white,
                fontSize: 20
              )),
            )),
          ),
               SizedBox(height: 60,),
          GestureDetector(
            onTap: (){
             setState(() {
               num++;
               if(questionBank.questionwala[num].answer==true){
                 score++;

                 if(num==9){
                   Alert(message: 'Quiz is finished,you are playing well,you score is $score').show();
                   child: Text('Finished');
                   setState(() {
                     num=0;
                     score=0;
                   });
                 }
               }
             });},

            child: Center(
              child: Container(
                  color: Colors.greenAccent[700],
                  height: 80,
                  margin: EdgeInsets.all(15),
                  child: Center(child: Text('True',style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                  ),),
                  )),
            ),
          ),

          GestureDetector(
            onTap: (){
              setState(() {
                num++;
                if(questionBank.questionwala[num].answer==false){
                  score++;
                  if(num==9){
                    Alert(message: 'Quiz is finished,you are playing well,you score is $score').show();
                    child: Text('Finished');
                    setState(() {
                      num=0;
                      score=0;
                    });
                  }
                }
              });},
            child: Center(
              child: Container(
                  color: Colors.red,
                  height: 80,
                  margin: EdgeInsets.all(15),

                  child: Center(child: Text('False',style: TextStyle(
                    fontSize: 34,
                    color: Colors.white
                  ),),
                  )),
            ),
          )
        ],
      ),
    );
  }
}




