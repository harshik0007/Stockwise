import 'package:flutter/material.dart';
import '../resources/app_colors.dart';

class SimpleBarChart extends StatelessWidget {
  final List<double> values;
  final List<String> labels;

  const SimpleBarChart({super.key, required this.values, required this.labels});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: CustomPaint(
        painter: BarChartPainter(values: values, labels: labels),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<double> values;
  final List<String> labels;

  BarChartPainter({required this.values, required this.labels});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty || labels.isEmpty) {
      return;
    }

    final double maxValue = values.reduce((a, b) => a > b ? a : b);

    if (maxValue <= 0) {
      return;
    }

    const double leftPadding = 32;
    const double rightPadding = 8;
    const double topPadding = 10;
    const double bottomPadding = 25;

    final double chartWidth = size.width - leftPadding - rightPadding;

    final double chartHeight = size.height - topPadding - bottomPadding;

    // -------------------------
    // PAINTS
    // -------------------------

    final Paint axisPaint = Paint()
      ..color = Colors.grey.shade500
      ..strokeWidth = 1;

    final Paint barPaint = Paint()..color = AppColors.primaryColor;

    // -------------------------
    // AXIS
    // -------------------------

    final double xAxisY = topPadding + chartHeight;

    canvas.drawLine(
      Offset(leftPadding, topPadding),
      Offset(leftPadding, xAxisY),
      axisPaint,
    );

    canvas.drawLine(
      Offset(leftPadding, xAxisY),
      Offset(leftPadding + chartWidth, xAxisY),
      axisPaint,
    );

    // -------------------------
    // Y AXIS LABELS
    // -------------------------

    const List<String> yLabels = [
      '60k',
      '50k',
      '40k',
      '30k',
      '20k',
      '10k',
      '0',
    ];

    for (int i = 0; i < yLabels.length; i++) {
      final double y = topPadding + (chartHeight / 6) * i;

      _drawText(
        canvas,
        text: yLabels[i],
        position: Offset(0, y - 6),
        width: 28,
        fontSize: 7,
        color: Colors.grey.shade700,
        alignment: TextAlign.right,
      );
    }

    // -------------------------
    // BARS
    // -------------------------

    final int count = values.length;

    final double slotWidth = chartWidth / count;

    const double barWidth = 14;

    for (int i = 0; i < count; i++) {
      final double value = values[i];

      final double barHeight = (value / maxValue) * chartHeight * 0.82;

      final double x =
          leftPadding + (i * slotWidth) + (slotWidth - barWidth) / 2;

      final double barTop = xAxisY - barHeight;

      // Draw bar
      canvas.drawRect(Rect.fromLTWH(x, barTop, barWidth, barHeight), barPaint);

      // Value above bar
      _drawText(
        canvas,
        text: _formatValue(value),
        position: Offset(x - 14, barTop - 11),
        width: 42,
        fontSize: 6.5,
        color: Colors.black,
        alignment: TextAlign.center,
      );

      // X axis label
      final String label = i < labels.length ? labels[i] : '';

      _drawText(
        canvas,
        text: label,
        position: Offset(x - 17, xAxisY + 3),
        width: 48,
        fontSize: 6.5,
        color: Colors.black,
        alignment: TextAlign.center,
      );
    }
  }

  void _drawText(
    Canvas canvas, {
    required String text,
    required Offset position,
    required double width,
    required double fontSize,
    required Color color,
    required TextAlign alignment,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: fontSize, color: color),
      ),
      textAlign: alignment,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: width, maxWidth: width);

    textPainter.paint(canvas, position);
  }

  String _formatValue(double value) {
    if (value >= 1000) {
      final double valueInThousands = value / 1000;

      if (valueInThousands == valueInThousands.roundToDouble()) {
        return '${valueInThousands.toInt()},000';
      }

      return '${valueInThousands.toStringAsFixed(1)}k';
    }

    return value.toInt().toString();
  }

  @override
  bool shouldRepaint(covariant BarChartPainter oldDelegate) {
    return oldDelegate.values != values || oldDelegate.labels != labels;
  }
}
