import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MagicBall());
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballValue = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        // AppBar
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Magic Ball 8'),
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.blue.shade300,
              ],
            ),
          ),
          child: SafeArea(
            // A container can only have one child:
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Magic ball 8 Image
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Image(
                        image: AssetImage('images/ball$ballValue.png'),
                      ),
                    ),
                  ),

                  // Button: It changes the magic ball images
                  RaisedButton(
                    onPressed: () {
                      setRandomBallImage();
                    },
                    color: Colors.white,
                    textColor: Colors.blue.shade900,
                    padding: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Answer me',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int getRandomNumber(int min, max) {
    Random random = new Random();
    return (min + random.nextInt(max - min + 1));
  }

  void setRandomBallImage() {
    setState(() {
      ballValue = getRandomNumber(1, 5);
    });
  }
}
