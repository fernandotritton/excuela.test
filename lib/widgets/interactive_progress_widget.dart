import 'package:flutter/material.dart';
import 'dart:math' as math;


// Este widget de progreso interactivo permite al usuario actualizar el progreso arrastrando alrededor del círculo. 
//Incluye animaciones suaves y es personalizable en términos de tamaño, color y grosor del trazo.
class InteractiveProgressWidget extends StatefulWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  const InteractiveProgressWidget({super.key, 
    this.size = 200,
    this.color = Colors.blue,
    this.strokeWidth = 10,
  });

  @override
  _InteractiveProgressWidgetState createState() => _InteractiveProgressWidgetState();
}

class _InteractiveProgressWidgetState extends State<InteractiveProgressWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateProgress(double newProgress) {
    setState(() {
      _progress = newProgress.clamp(0.0, 1.0);
      _controller.animateTo(_progress);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        RenderBox box = context.findRenderObject() as RenderBox;
        final center = box.size.center(Offset.zero);
        final position = box.globalToLocal(details.globalPosition);
        final angle = (position - center).direction;
        final newProgress = (angle + math.pi) / (2 * math.pi);
        _updateProgress(newProgress);
      },
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: ProgressPainter(
          progress: _controller.value,
          color: widget.color,
          strokeWidth: widget.strokeWidth,
        ),
        child: Center(
          child: Text(
            '${(_progress * 100).toInt()}%',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  ProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      progressAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

