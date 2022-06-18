import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int rotate = 0;

  void setRotation() {
    setState(() {
      rotate++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: const Text("Rotate picture"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InteractiveViewer(
                minScale: 0.2,
                constrained: true,
                scaleEnabled: true,
                child: RotatedBox(
                  quarterTurns: rotate,
                  child: Image.network(
                      ("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=640:*"),
                      fit: BoxFit.cover,
                      width: 250,
                      height: 250),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(),
                child: const Text("Rotate"),
                onPressed: () {
                  setRotation();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.computer),
          onPressed: () {
            print("du har klickat på datorknappen");
          },
        ),
      ),
    );
  }
}
