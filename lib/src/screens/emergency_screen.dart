import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_pinterest/src/widgets/boton_listado.dart';
import 'package:flutter_pinterest/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge = false;
    if (MediaQuery.of(context).size.height > 550) {
      isLarge = true;
    }

    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 500),
              child: BotonListado(
                icon: item.icon,
                texto: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: () {
                  print('pulsado');
                },
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: (isLarge) ? 220 : 10),
            child: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  if(isLarge)
                    SizedBox(
                      height: 90,
                    ),
                  
                  ...itemMap
                ],
              ),
            ),
          ),
          if (isLarge)
            Stack(children: [
              IconHeader(
                  icon: FontAwesomeIcons.plus,
                  titulo: 'Asistencia médica',
                  subtitulo: 'Solicita'),
              Positioned(
                top: 45,
                right: 0,
                child: RawMaterialButton(
                  child: FaIcon(
                    FontAwesomeIcons.ellipsisV,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15.0),
                ),
              )
            ])
        ],
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Asistencia médica',
      subtitulo: 'Solicita',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}

class _BotonListadoTmp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotonListado(
      texto: 'Test',
      icon: FontAwesomeIcons.plus,
      onPress: () {
        print('click');
      },
    );
  }
}
