import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Xylophone(),
        ),
      ),
    );
  }
}

class Xylophone extends StatelessWidget {
  final List<Color> myColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.indigo
  ];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: Text(
            'Xylophone',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Column(
          children: List.generate(
            myColors.length,
            (index) {
              var noteIndex = index + 1;
              return SizedBox(
                height: availableHeight / 8,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    final player = AudioCache();
                    player.play('note$noteIndex.wav');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      myColors[index],
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    )),
                  ),
                  child: Container(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
