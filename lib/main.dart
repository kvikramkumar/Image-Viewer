import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _image = [
    "assets/captain.jpg",
    "assets/ironman.jpg",
    "assets/spidy.jpg",
  ];
  int _currentIndex = 0;
  void _showNextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _image.length;
    });
  }

  void _showPreviousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _image.length) % _image.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Image Viewer"),
              backgroundColor: Colors.teal,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _image[_currentIndex],
                    width: 300.0,
                    height: 400.0,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        child: const Icon(Icons.arrow_left),
                        onPressed: _showPreviousImage,
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      FloatingActionButton(
                        child: const Icon(Icons.arrow_right),
                        onPressed: _showNextImage,
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
