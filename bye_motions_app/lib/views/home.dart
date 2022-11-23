import 'package:bye_motions_app/views/motion.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 20, 50),
            child: Text(
              "BYE MOTIONS",
              style: TextStyle(
                fontSize: 70,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox( 
            height: 100,
            width: 200, //height of button //width of button
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                elevation: 0,
                textStyle: const TextStyle(
                  fontSize: 30,
                )
              ),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Motion())
                );
              },
              child: const Text(
                "Sortear Moção",
                textAlign: TextAlign.center,
              ),
            )
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 20, 30),
            child: Column(
              children: [
                Text(
                  "App feito por Gabriel Moreira",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Database by Hello Motions",
                ),
              ],
            )
          )
        ],
      ),
    );
  }

}