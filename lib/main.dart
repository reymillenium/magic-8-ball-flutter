import 'package:quiver/async.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

void main() {
  runApp(MagicBall());
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballImageValue = 1;

  @override
  Widget build(BuildContext context) {
    // ShakeDetector detector = ShakeDetector.waitForStart(onPhoneShake: () {
    //   _setRandomBallImage();
    // });
    // detector.startListening();
    // Another way: Using the phone's movement sensor to execute something:
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      _setRandomBallImage();
    });
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Magic ball 8 Image
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: Image(
                          image: AssetImage('images/ball$ballImageValue.png'),
                          key: ValueKey(ballImageValue),
                        ),
                      ),
                    ),
                  ),

                  // Button: It changes the magic ball images
                  RaisedButton(
                    onPressed: () {
                      _setRandomBallImage();
                    },
                    color: Colors.white,
                    textColor: Colors.blue.shade900,
                    padding: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Answer me',
                          style: TextStyle(
                            fontSize: 20,
                          ),
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

  void _setRandomBallImage() {
    final countDownTimer = CountdownTimer(Duration(milliseconds: 2500), Duration(milliseconds: 500));
    countDownTimer.listen((data) {
      setState(() {
        ballImageValue = countDownTimer.elapsed.inMilliseconds ~/ 500.0;
      });
    }, onDone: () {
      countDownTimer.cancel();
      setState(() {
        ballImageValue = getRandomNumber(1, 5);
      });
    });
  }

  int getRandomNumber(int min, max) {
    Random random = new Random();
    return (min + random.nextInt(max - min + 1));
  }
}
