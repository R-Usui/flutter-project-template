import 'dart:math';

import 'package:flutter/material.dart';

class Map2dSamplePage extends StatelessWidget {
  const Map2dSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Map2dField(
        [
          [],
          [
            Map2dCellEmpty(),
            Map2dCellConn(false, false, true, true, color: Map2dColor.blue),
            Map2dCellConn(true, false, true, false, color: Map2dColor.blue),
            Map2dCellButton(text: "2a", color: Map2dColor.blue),
            Map2dCellConn(true, false, true, false),
            Map2dCellConn(true, false, false, true),
            Map2dCellEmpty(),
          ],
          [
            Map2dCellEmpty(),
            Map2dCellConn(false, true, false, true, color: Map2dColor.blue),
            Map2dCellEmpty(),
            Map2dCellEmpty(),
            Map2dCellEmpty(),
            Map2dCellConn(false, true, false, true),
            Map2dCellEmpty(),
          ],
          [
            Map2dCellEmpty(),
            Map2dCellButton(text: "1", color: Map2dColor.blue),
            Map2dCellConn(true, false, true, false, color: Map2dColor.red),
            Map2dCellButton(text: "2b", color: Map2dColor.red),
            Map2dCellConn(true, false, true, false),
            Map2dCellButton(text: "3", color: Map2dColor.grey),
            Map2dCellEmpty(),
          ],
          [],
        ],
      ),
    );
  }
}

class Map2dField extends StatelessWidget {
  const Map2dField(
    this.cell2dList, {
    super.key,
  });

  final List<List<Map2dCell>> cell2dList;

  int get numberRows => cell2dList.length;

  List<Map2dCell> rowAt(int index) =>
      index < numberRows ? cell2dList[index] : [];

  int numberColsInRowAt(int index) =>
      index < numberRows ? rowAt(index).length : 0;

  int get numberColsMax {
    int result = 1;

    for (int row = 0; row < numberRows; ++row) {
      max(result, numberColsInRowAt(row));
    }
    return result;
  }

  Map2dCell cellAt(int rowIndex, int colIndex) {
    if (rowIndex < numberRows && colIndex < numberColsInRowAt(rowIndex)) {
      return cell2dList[rowIndex][colIndex];
    } else {
      return const Map2dCellEmpty();
    }
  }

  int verticalFlexAt(int rowIndex) {
    int result = 1;

    for (int colIndex = 0; colIndex < numberColsInRowAt(rowIndex); ++colIndex) {
      result = max(result, cellAt(rowIndex, colIndex).verticalFlex);
    }

    return result;
  }

  int horizontalFlexAt(int colIndex) {
    int result = -1;

    for (int rowIndex = 0; rowIndex < numberRows; ++rowIndex) {
      result = max(result, cellAt(rowIndex, colIndex).horizontalFlex);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int rowIndex = 0; rowIndex < numberRows; ++rowIndex)
          Expanded(
            flex: verticalFlexAt(rowIndex),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int colIndex = 0;
                    colIndex < numberColsInRowAt(rowIndex);
                    ++colIndex)
                  Expanded(
                    flex: horizontalFlexAt(colIndex),
                    child: cellAt(rowIndex, colIndex),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class Map2dCellConn extends Map2dCell {
  const Map2dCellConn(
    this.left,
    this.up,
    this.right,
    this.down, {
    super.color,
    super.key,
  }) : super(
          horizontalFlex: 1,
          verticalFlex: 1,
        );

  final bool left, up, right, down;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: CustomPaint(
            size: constraints.biggest,
            painter: _ConnectorPainter(color.value, left, up, right, down),
          ),
        );
      },
    );
  }
}

class _ConnectorPainter extends CustomPainter {
  const _ConnectorPainter(
    this.color,
    this.left,
    this.up,
    this.right,
    this.down,
  );

  final Color color;
  final bool left, up, right, down;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2.0, size.height / 2.0);
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill;

    if (left) {
      canvas.drawLine(center, Offset(0, size.height / 2), paint);
    }
    if (up) {
      canvas.drawLine(center, Offset(size.width / 2, 0), paint);
    }
    if (right) {
      canvas.drawLine(center, Offset(size.width, size.height / 2), paint);
    }
    if (down) {
      canvas.drawLine(center, Offset(size.width / 2, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Map2dCellButton extends Map2dCell {
  const Map2dCellButton({
    required this.text,
    super.color,
    super.key,
  }) : super(
          horizontalFlex: 3,
          verticalFlex: 3,
        );

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color.value,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () {},
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

class Map2dCellEmpty extends Map2dCell {
  const Map2dCellEmpty({
    super.key,
  }) : super(
          horizontalFlex: 1,
          verticalFlex: 1,
          color: Map2dColor.grey,
        );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

abstract class Map2dCell extends StatelessWidget {
  const Map2dCell({
    this.horizontalFlex = 1,
    this.verticalFlex = 1,
    this.color = Map2dColor.grey,
    super.key,
  });

  final int horizontalFlex;
  final int verticalFlex;
  final Map2dColor color;
}

enum Map2dColor {
  grey(Color.fromARGB(151, 225, 219, 219)),
  blue(Color.fromARGB(255, 184, 184, 246)),
  red(Color.fromARGB(255, 255, 170, 170));

  const Map2dColor(this.value);

  final Color value;
}
