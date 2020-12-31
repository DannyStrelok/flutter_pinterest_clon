import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  @override
  _CircularProgressScreenState createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  double porcentaje = 10.0;
  double nuevoPorcenaje = 0.0;

  @override
  void initState() {
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    animationController.addListener(() {
      // print('valor controller: ${animationController.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcenaje, animationController.value);
      });

    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          porcentaje = nuevoPorcenaje;
          nuevoPorcenaje+=10;
          if(nuevoPorcenaje > 100) {
            nuevoPorcenaje = 0;
            porcentaje = 0;
          }
          animationController.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300.0,
          height: 300.0,
          child: CustomPaint(
            painter: _RadiaProgressPainter(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _RadiaProgressPainter extends CustomPainter {

  final double porcentaje;

  _RadiaProgressPainter(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {



    // PRIMER CIRCULO
    final paint = new Paint()
        ..strokeWidth = 4.0
        ..color = Colors.grey
        ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height /2);

    canvas.drawCircle(center, radius, paint);

    // ARCO
    final paintArco = new Paint()
          ..strokeWidth = 10
          ..color = Colors.pink
          ..style = PaintingStyle.stroke;

    double arcoAngulo = 2 * pi * ( porcentaje / 100 );
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi/2,
        arcoAngulo,
        false,
        paintArco
    );


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
