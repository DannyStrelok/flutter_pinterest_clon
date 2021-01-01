import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  IconHeader(
      {@required this.icon, @required this.titulo, @required this.subtitulo, this.color1 = const Color(0xff526bf6), this.color2 = const Color(0xff67acf2)});

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(children: [
      _IconHeaderBackground(this.color1, this.color2),
      Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            this.icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          )),
      Column(
        children: [
          SizedBox(
            height: 80,
            width: double.infinity,
          ),
          Text(
            this.subtitulo,
            style: TextStyle(fontSize: 20, color: colorBlanco),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            this.titulo,
            style: TextStyle(
                fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          FaIcon(
            this.icon,
            size: 80,
            color: Colors.white,
          )
        ],
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;


  _IconHeaderBackground(this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
          gradient: LinearGradient(colors: <Color>[
            this.color1,
            this.color2,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
        color: Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    final path = new Path();
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}


class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    final path = new Path();
    path.lineTo(size.width, size.height );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class HeaderRombo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderRomboPainter(),
      ),
    );
  }
}

class _HeaderRomboPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    final path = new Path();
    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.35, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class HeaderOla extends StatelessWidget {

  final Color color;


  HeaderOla({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderOlaPainter(this.color),
      ),
    );
  }
}

class _HeaderOlaPainter extends CustomPainter{

  final Color color;


  _HeaderOlaPainter(
      this.color
      );

  @override
  void paint(Canvas canvas, Size size) {

    final Gradient gradient = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.red,
          this.color,
          Color(0xff6D05FA)
        ],
        stops: [
          0.3,
          0.5,
          1
        ]
    );
    final Rect rect = new Rect.fromCircle(
        center: Offset(size.width * 0.5, (size.height * 0.25) * 0.5),
        radius: 180
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    paint.color = this.color; //Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
