import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BallPage());
}

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 227, 177, 235),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Center(
            child: Text('Ask Me Anything'),
          ),
        ),
        body: const Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 0;
  String text = '';

  // random generate ball number and show the tally text
  void randomBallNumber() {
    ballNumber = Random().nextInt(5) + 1;
    if (ballNumber == 1) {
      text = 'Yes';
    } else if (ballNumber == 2) {
      text = 'No';
    } else if (ballNumber == 3) {
      text = 'Ask Again Later';
    } else if (ballNumber == 4) {
      text = 'The Answer is Yes';
    } else if (ballNumber == 5) {
      text = 'I have no idea';
    }
  }

  @override
  // set initial images to ball1
  void initState() {
    ballNumber = 1;
    text = 'Yes';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String combineText = 'Ball Number $ballNumber : ${text.toUpperCase()}';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          pause: const Duration(milliseconds: 4000),
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText(
              'Click Image for more result',
              textStyle: const TextStyle(
                color: Colors.purple,
                fontFamily: 'Alkatra',
                fontSize: 18,
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  randomBallNumber();
                });
                print('Ball Number: $ballNumber');
              },
              child: Image.asset(
                'assets/ball$ballNumber.png',
              ),
            ),
          ),
        ),
        Text(
          combineText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
