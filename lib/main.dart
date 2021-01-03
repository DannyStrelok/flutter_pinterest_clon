import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/models/layout_model.dart';
import 'package:flutter_pinterest/src/screens/launcher_screen.dart';
import 'package:flutter_pinterest/src/screens/launcher_tablet_screen.dart';
import 'package:flutter_pinterest/src/theme/theme.dart';
import 'package:provider/provider.dart';

// void main() => runApp(
//     ChangeNotifierProvider(
//       create: (_) => new ThemeChanger(1),
//         child: MyApp()
//     )
// );

void main() => runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeChanger>( create: (_) => new ThemeChanger(1),),
          ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel())
        ],
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
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          print('$orientation');
          final screenSize = MediaQuery.of(context).size;

          if(screenSize.width > 500) {
            return LauncherTabletScreen();
          } else {
            return LauncherScreen();
          }

        },
      )
      //LauncherScreen(),
    );
  }
}
