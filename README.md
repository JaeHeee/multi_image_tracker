# Multi Image Tracker 

<p align="center"> 
<img src="https://user-images.githubusercontent.com/40454769/134151610-ce9fc423-303d-4e6d-97c0-c82b16c07089.gif" width="40%">
</p>


<p>A flutter package which makes it easy to track a series of images.</p>
<br>
<br>

# Installation
In the `dependencies:` section of your `pubspec.yaml`, add the following line:

[![Version](https://img.shields.io/badge/pub-v1.0.0-blue)](https://pub.dev/packages/multi_image_tracker)

```yaml
dependencies:
  multi_image_tracker: <latest version>
```

<br>
<br>

# Usage

### Import this class

```dart
import 'package:multi_image_tracker/multi_image_tracker.dart';
```

### multi image tracker

```dart
   MultiImageTracker(
     images: [Image.asset('assets/day1.jpg'),
             Image.asset('assets/day2.jpg'),
             Image.asset('assets/day3.jpg')],
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     clipFactor: 0.6,
   ),
```

<br>
<br>

# Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
