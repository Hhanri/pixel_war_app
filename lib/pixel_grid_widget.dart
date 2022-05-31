import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import 'helpers.dart';

class PixelGridWidget extends StatefulWidget {
  const PixelGridWidget({Key? key}) : super(key: key);

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

  static const double cellWidth = 20.0;
  static const double cellHeight = 20.0;
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
  }

  @override
  void dispose() {
    transformationController.removeListener(onChangeTransformation);
    transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer.builder(
      minScale: .01,//cellHeight / MediaQuery.of(context).size.height,
      maxScale: 5,
      scaleEnabled: true,
      transformationController: transformationController,
      builder: (BuildContext context, vector.Quad viewport) {
        return Container(
          constraints: const BoxConstraints.tightForFinite(),
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
    );
  }
}

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
  static PixelModel greenPixel = PixelModel(color: Colors.green, username: '');
  static PixelModel redPixel = PixelModel(color: Colors.red, username: '');
  static PixelModel bluePixel = PixelModel(color: Colors.blue, username: '');
}

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
      onTap: onTap,
      child: Container(
        height: 20,
        width: 20,
        color: pixelModel.color,
      ),
    );
  }
}
