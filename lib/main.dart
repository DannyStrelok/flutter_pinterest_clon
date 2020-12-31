import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/screens/launcher_screen.dart';
import 'package:flutter_pinterest/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(
      create: (_) => new ThemeChanger(1),
        child: MyApp()
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: appTheme.currentTheme,
      title: 'PINTEREST CLON',
      home: LauncherScreen(),
    );
  }
}
