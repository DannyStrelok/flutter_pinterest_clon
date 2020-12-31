import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_pinterest/src/challenges/cuadrado_animado_screen.dart';
import 'package:flutter_pinterest/src/screens/emergency_screen.dart';
import 'package:flutter_pinterest/src/screens/graficas_circulares_screen.dart';
import 'package:flutter_pinterest/src/screens/headers_screen.dart';
import 'package:flutter_pinterest/src/screens/pinterest_screen.dart';
import 'package:flutter_pinterest/src/screens/slideshow_screen.dart';
import 'package:flutter_pinterest/src/screens/sliver_list_screen.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', SlideshowScreen() ),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyScreen() ),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeadersScreen()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadrado animado', CuadradoAnimadoScreen()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra progreso', GraficasCircularesScreen()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestScreen()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListScreen())
];

class _Route {

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);


}
