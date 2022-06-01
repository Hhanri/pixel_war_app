import 'package:flutter/material.dart';
import 'package:pixel_war_app/models/pixel_model.dart';
import 'package:pixel_war_app/widgets/pixel_widget.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../helpers/helpers.dart';

class PixelGridWidget extends StatefulWidget {
  final BuildContext parentContext;
  const PixelGridWidget({Key? key, required this.parentContext}) : super(key: key);

  @override
  State<PixelGridWidget> createState() => _PixelGridWidgetState();
}

  vector.Quad cachedViewport = vector.Quad();
  int firstVisibleColumn = 0;
  int firstVisibleRow = 0;
  int lastVisibleColumn = 0;
  int lastVisibleRow = 0;

class _PixelGridWidgetState extends State<PixelGridWidget> {

  final TransformationController transformationController = TransformationController();

  static const double cellWidth = PixelModel.pixelWidth;
  static const double cellHeight = PixelModel.pixelHeight;
  static int rowCount = gridTest.length;
  static int columnCount = gridTest[0].length;

  bool isCellVisible({required int row, required int column, required vector.Quad viewport}) {
    if (viewport != cachedViewport) {
      final Rect aabb = axisAlignedBoundingBox(viewport);
      cachedViewport = viewport;
      firstVisibleRow = (aabb.top / cellHeight).floor();
      firstVisibleColumn = (aabb.left / cellWidth).floor();
      lastVisibleRow = (aabb.bottom / cellHeight).floor();
      lastVisibleColumn = (aabb.right / cellWidth).floor();
    }
    return row >= firstVisibleRow && row <= lastVisibleRow
        && column >= firstVisibleColumn && column <= lastVisibleColumn;
  }

  void onChangeTransformation() {
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    transformationController.addListener(onChangeTransformation);
    transformationController.value.scale(35.0);
  }

  @override
  void dispose() {
    transformationController.removeListener(onChangeTransformation);
    transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer.builder(
        minScale: 0.0001,//cellHeight / MediaQuery.of(context).size.height,
        maxScale: 50,
        scaleEnabled: true,
        boundaryMargin: EdgeInsets.zero,
        transformationController: transformationController,
        builder: (BuildContext context, vector.Quad viewport) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int row = 0; row < rowCount; row++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int column = 0; column < columnCount; column++)
                        isCellVisible(row: row, column: column, viewport: viewport)
                          ? PixelWidget(
                              pixelModel: gridTest[row][column],
                              onTap: () {
                                setState(() {
                                  gridTest[row][column] = PixelModel(color: Colors.black, username: '');
                                });
                              },
                            )
                          : const SizedBox(height: cellHeight, width: cellWidth)
                    ],
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}


