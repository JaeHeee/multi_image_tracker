import 'package:flutter/material.dart';
import 'package:multi_image_tracker/multi_image_tracker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi image tracker example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi Image Tracker'), centerTitle: true),
      body: MultiImageTracker(
        images: [
          Image.asset('assets/images/image.jpg',
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.2),
              colorBlendMode: BlendMode.modulate),
          Image.asset('assets/images/image.jpg',
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.4),
              colorBlendMode: BlendMode.modulate),
          Image.asset('assets/images/image.jpg',
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.6),
              colorBlendMode: BlendMode.modulate),
          Image.asset(
            'assets/images/image.jpg',
            fit: BoxFit.cover,
          ),
        ],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipFactor: 0.6,
      ),
    );
  }
}
