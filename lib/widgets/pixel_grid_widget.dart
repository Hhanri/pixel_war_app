import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pixel_war_app/models/pixel_model.dart';
import 'package:pixel_war_app/screens/no_state_error_screen.dart';
import 'package:pixel_war_app/services/supabase_service.dart';
import 'package:pixel_war_app/widgets/pixel_widget.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import '../helpers/helpers.dart';

class PixelGridWidget extends HookWidget {
  PixelGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILDING PIXELGRIDWIDGET");

    final TransformationController transformationController = useTransformationController();
    transformationController.value.scale(22.78095238095238);
    late final StreamController<List<Map<String, dynamic>>> streamController;
    streamController = useStreamController<List<Map<String, dynamic>>>(
      onListen: () {
        streamController.addStream(SupabaseService().getStreamGameGrid);
      }
    );

    return Center(
      child: InteractiveViewer.builder(
        minScale: 0.0001,
        key: UniqueKey(),
        maxScale: 30,
        scaleEnabled: true,
        boundaryMargin: EdgeInsets.zero,
        transformationController: transformationController,
        builder: (context, vector.Quad viewport) {
          return StreamBuilder<List<Map<String, dynamic>>>(
            stream: streamController.stream,//streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
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
                                  key: ValueKey(snapshot.data!.firstWhere((element) => element['row_n'] == row && element['column_n'] == column)['id']),
                                  pixelModel: PixelModel(
                                  color: Color(int.parse(snapshot.data!.firstWhere((element) => element['row_n'] == row && element['column_n'] == column)['color'])),
                                  username: snapshot.data!.firstWhere((element) => element['row_n'] == row && element['column_n'] == column)['username']),
                                  onTap: () {
                                    //final newGrid = snapshot.data!
                                    //    ..[row][column] = PixelModel(color: Colors.black, username: '');
                                    //gridStreamController.sink.add(newGrid);
                                  },
                                )
                              : const SizedBox(height: cellHeight, width: cellWidth)
                        ],
                      )
                  ],
                );
              } else {
                return const NoStateErrorScreen();
              }
            }
          );
        }
      )
    );
  }
  vector.Quad cachedViewport = vector.Quad();
  int firstVisibleColumn = 0;
  int firstVisibleRow = 0;
  int lastVisibleColumn = 0;
  int lastVisibleRow = 0;
  static const double cellWidth = PixelModel.pixelWidth;
  static const double cellHeight = PixelModel.pixelHeight;
  static int rowCount = 10; //gridTest.length;
  static int columnCount = 10; //gridTest[0].length;
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
}
