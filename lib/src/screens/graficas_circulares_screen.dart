import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/theme/theme.dart';
import 'package:flutter_pinterest/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class GraficasCircularesScreen extends StatefulWidget {
  @override
  _GraficasCircularesScreenState createState() =>
      _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                height: 150,
                child: RadiaProgress(
                  porcentaje: porcentaje,
                  colorPrimario: Colors.green,
                  colorSecundario: appTheme.textTheme.bodyText1.color,
                  grosorSecundario: 1.0,
                ),
              ),
              Container(
                width: 150,
                height: 150,
                child: RadiaProgress(
                  porcentaje: porcentaje,
                  colorPrimario: Colors.green,
                  colorSecundario: appTheme.textTheme.bodyText1.color,
                  grosorSecundario: 1.0,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                height: 150,
                child: RadiaProgress(
                  porcentaje: porcentaje,
                  colorPrimario: Colors.green,
                  colorSecundario: appTheme.textTheme.bodyText1.color,
                  grosorSecundario: 1.0,
                ),
              ),
              Container(
                width: 150,
                height: 150,
                child: RadiaProgress(
                  porcentaje: porcentaje,
                  colorPrimario: Colors.green,
                  colorSecundario: appTheme.textTheme.bodyText1.color,
                  grosorSecundario: 1.0,
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
