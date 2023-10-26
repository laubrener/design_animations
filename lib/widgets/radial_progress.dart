import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color? color;
  final Color? colorSecundario;
  final double? grosor;
  final double? grosorSecundario;
  final StrokeCap? bordes;

  const RadialProgress(
      {super.key,
      required this.porcentaje,
      this.color = Colors.amber,
      this.colorSecundario = Colors.grey,
      this.grosor = 10,
      this.grosorSecundario = 4,
      this.bordes = StrokeCap.round});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: _MiRadialProgress(
                  porcentaje: (widget.porcentaje - diferenciaAnimar) +
                      (diferenciaAnimar * controller.value),
                  color: widget.color,
                  colorSecundario: widget.colorSecundario,
                  grosor: widget.grosor,
                  grosorSecundario: widget.grosorSecundario,
                  bordes: widget.bordes,
                ),
              ));
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;
  final Color? color;
  final Color? colorSecundario;
  final double? grosor;
  final double? grosorSecundario;
  final StrokeCap? bordes;

  _MiRadialProgress({
    required this.porcentaje,
    this.color,
    this.colorSecundario,
    this.grosor,
    this.grosorSecundario,
    this.bordes,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // agregar gradiente al aco:
    final Rect rect = Rect.fromCircle(
      center: const Offset(-20, 0),
      radius: 180,
    );
    final Gradient gradiente = LinearGradient(colors: [
      const Color(0xffC012FF),
      const Color(0xff6D05E8),
      Colors.purple.shade100,
    ]);
    // Círculo
    final paint = Paint()
      ..strokeWidth = grosorSecundario!
      ..color = colorSecundario!
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arco
    final paintArco = Paint()
      ..strokeWidth = grosor!
      ..strokeCap = bordes!
      // ..color = color!
      ..shader = gradiente.createShader(rect)
      ..style = PaintingStyle.stroke;

    // parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
