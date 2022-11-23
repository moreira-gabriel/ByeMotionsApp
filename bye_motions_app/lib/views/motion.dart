import 'package:flutter/material.dart';
import 'package:bye_motions_app/feedback_form.dart';
import 'package:bye_motions_app/views/home.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class Motion extends StatefulWidget 
{
  const Motion({Key? key}) : super(key: key);

  @override
  State<Motion> createState() => _MotionState();
}

class _MotionState extends State<Motion> 
{
  FeedbackModel motionText = FeedbackModel(" ");

  dynamic getFeedbackFromSheet() async
  {
    var response = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycbybuJywbOWxpYSE-IP_RGUxciJ8jhJCdSjKEq3hO1gIFLx4qKZB7G4s9IlnIhUNP39h0Q/exec"));
  
    var jsonFeedback = convert.jsonDecode(response.body); 

    setState(() {
      motionText.motionText = jsonFeedback["motion"];
    });

    EasyLoading.dismiss();
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    
    EasyLoading.instance
    ..userInteractions = false;

    EasyLoading.show(
      status: "Carregando",
    );    
    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Center(child: Text("Moção sorteada")),
        backgroundColor: Colors.purple[300],
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 20.0,
        ),
      ),

      body: Column(
        children: [   
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Text(
              motionText.motionText,
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox( 
              height: 50, //height of button
              width: 200, //width of button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[300],
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 15,
                  )
                ),
                onPressed: (){
                  getFeedbackFromSheet();
                },
                child: const Text("Sortear Novamente"),
              )
            ),
          ),
        ]
      ),
    );
  }

  void backToMenu() 
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const Home())
    );
  }
}