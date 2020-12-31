import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween<double>(begin: 0.0, end: 4.0 * Math.pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut
      )
    );
    opacidad = Tween<double>(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.5, curve: Curves.easeOut)
    ));
    opacidadOut = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeOut)
      )
    );

    moverDerecha = Tween<double>(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut
      )
    );

    agrandar = Tween<double>(begin: 0.0, end: 2.0).animate(animationController);
    
    animationController.addListener(() {
      // print('Status: ${animationController.status}');
      if(animationController.status == AnimationStatus.completed) {
        //animationController.reverse();
      }
    });

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {

        //print(rotacion.value);
        print('opacidad: ${opacidad.value}');
        print('rotacion: ${rotacion.status}');

        return Opacity(
          //opacity: (opacidad.value < 1.0) ? opacidad.value : opacidadOut.value,
          opacity: opacidad.value - opacidadOut.value,
          child: Transform.scale(
            scale: agrandar.value,
            child: Transform.translate(
              offset: Offset(moverDerecha.value, 0),
              child: Transform.rotate(
                  angle: rotacion.value,
                  child: child
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70, height: 70, decoration: BoxDecoration(color: Colors.blue));
  }
}
