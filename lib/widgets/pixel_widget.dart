import 'package:flutter/material.dart';
import 'package:pixel_war_app/models/pixel_model.dart';

class PixelWidget extends StatelessWidget {
  final PixelModel pixelModel;
  final VoidCallback onTap;
  const PixelWidget({
    Key? key,
    required this.pixelModel,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: onTap,
      child: Container(
        height: PixelModel.pixelHeight,
        width: PixelModel.pixelWidth,
        color: pixelModel.color,
      ),
    );
  }
}