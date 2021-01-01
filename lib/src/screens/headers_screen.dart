import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/theme/theme.dart';
import 'package:flutter_pinterest/src/widgets/headers.dart';
import 'package:provider/provider.dart';

class HeadersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      body: HeaderOla(color: appTheme.accentColor,)
    );
  }
}
