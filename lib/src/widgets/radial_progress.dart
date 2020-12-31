import 'dart:math';

import 'package:flutter/material.dart';

class RadiaProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;

  RadiaProgress(
      {@required this.porcentaje,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.grosorSecundario = 4.0});

  @override
  _RadiaProgressState createState() => _RadiaProgressState();
}

class _RadiaProgressState extends State<RadiaProgress>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double porcentajeAnterior;

  @override
  void initState() {
    super.initState();
    porcentajeAnterior = widget.porcentaje;
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0.0);

    final diferenciaAnimacion = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Container(
              padding: EdgeInsets.all(10.0),
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: _RadiaProgressPainter(
                    (widget.porcentaje - diferenciaAnimacion) +
                        (diferenciaAnimacion * animationController.value),
                    widget.colorPrimario,
                    widget.colorSecundario,
                    widget.grosorSecundario),
              ));
        });
  }
}

class _RadiaProgressPainter extends CustomPainter {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;

  _RadiaProgressPainter(this.porcentaje, this.colorPrimario,
      this.colorSecundario, this.grosorSecundario);

  @override
  void paint(Canvas canvas, Size size) {

    final Gradient gradiente = new LinearGradient(
      colors: [
        Colors.red,
        Colors.yellow,
        Colors.red
      ]
    );
    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0, 0.0),
      radius: 180.0
    );

    // PRIMER CIRCULO
    final paint = new Paint()
      ..strokeWidth = this.grosorSecundario
      ..color = this.colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    // ARCO
    final paintArco = new Paint()
      ..strokeWidth = 10
      // ..color = this.colorPrimario
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcoAngulo = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcoAngulo, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
