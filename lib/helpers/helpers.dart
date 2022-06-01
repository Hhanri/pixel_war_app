import 'dart:ui';

import 'package:vector_math/vector_math_64.dart';

Rect axisAlignedBoundingBox(Quad quad) {
  double? xMin;
  double? xMax;
  double? yMin;
  double? yMax;
  for (final Vector3 point in <Vector3>[quad.point0, quad.point1, quad.point2, quad.point3]) {
    if (xMin == null || point.x < xMin) {
      xMin = point.x;
    }
    if (xMax == null || point.x > xMax) {
      xMax = point.x;
    }
    if (yMin == null || point.y < yMin) {
      yMin = point.y;
    }
    if (yMax == null || point.y > yMax) {
      yMax = point.y;
    }
  }
  return Rect.fromLTRB(xMin!, yMin!, xMax!, yMax!);
}