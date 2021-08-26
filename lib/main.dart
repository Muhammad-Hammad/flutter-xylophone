import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
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
                  7,
                  (index) {
                    var noteIndex = index + 1;
                    return Padding(
                      padding: EdgeInsets.zero,
                      child: TextButton(
                        onPressed: () {
                          final player = AudioCache();
                          player.play('note$noteIndex.wav');
                        },
                        child: Container(
                          padding: EdgeInsets.zero,
                          height: 80,
                          color: myColors[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
