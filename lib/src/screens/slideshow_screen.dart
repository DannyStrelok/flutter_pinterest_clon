import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/theme/theme.dart';
import 'package:flutter_pinterest/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded( // EL SLIDESHOW NECESITA UN TAMAÑO DEFINIDO PARA FUNCIONAR, YA QUE EL COLUMN TIENE UN ALTO INFINITO
            child: Slideshow(
              indicatorPositionTop: false,
              bulletPrimary: 17,
              bulletSecondary: 10,
              colorPrimary: (appTheme.darkTheme) ? appTheme.currentTheme.accentColor : Colors.red,
              colorSecondary: Colors.green,
              slides: [
                SvgPicture.asset('assets/svgs/slide_1.svg'),
                SvgPicture.asset('assets/svgs/slide_2.svg'),
                SvgPicture.asset('assets/svgs/slide_3.svg'),
                SvgPicture.asset('assets/svgs/slide_4.svg'),
              ],
            ),
          ),
          Expanded(
            child: Slideshow(
              indicatorPositionTop: false,
              bulletPrimary: 25,
              bulletSecondary: 8,
              slides: [
                SvgPicture.asset('assets/svgs/slide_1.svg'),
                SvgPicture.asset('assets/svgs/slide_2.svg'),
                SvgPicture.asset('assets/svgs/slide_3.svg'),
                SvgPicture.asset('assets/svgs/slide_4.svg'),
              ],
            ),
          ),
          
        ],
      )
    );
  }
}
