import 'package:flutter/material.dart';

class CuadradoAnimadoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _CuadradoAnimado()),
    );
  }
}


class _CuadradoAnimado extends StatefulWidget {

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> derecha;
  Animation<double> arriba;
  Animation<double> izquierda;
  Animation<double> abajo;
  //Curves.bounceOut;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(duration: Duration(milliseconds: 4500), vsync: this);

    derecha = Tween<double>(begin: 0.0, end: 150.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 0.25, curve: Curves.bounceOut)
    ));
    arriba = Tween<double>(begin: 0.0, end: -150.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut)
    ));
    izquierda = Tween<double>(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut)
    ));
    abajo = Tween<double>(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.00, curve: Curves.bounceOut)
    ));

    animationController.repeat();

  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(
            derecha.value - izquierda.value,
            arriba.value + abajo.value
          ),
            child: child
        );
      }
    );
  }
}



class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.blue
            )
        );
    }
}