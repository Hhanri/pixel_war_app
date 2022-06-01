import 'package:flutter/material.dart';

final gridTest = [
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
  [PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel,PixelModel.greenPixel, PixelModel.bluePixel, PixelModel.redPixel],
];

class PixelModel {
  final Color color;
  final String username;

  PixelModel({required this.color, required this.username});

  static const double pixelWidth = 3.0;
  static const double pixelHeight = 3.0;

  static PixelModel greenPixel = PixelModel(color: Colors.green, username: '');
  static PixelModel redPixel = PixelModel(color: Colors.red, username: '');
  static PixelModel bluePixel = PixelModel(color: Colors.blue, username: '');
}