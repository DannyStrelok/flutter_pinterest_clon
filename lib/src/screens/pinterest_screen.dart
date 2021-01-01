import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/theme/theme.dart';
import 'package:flutter_pinterest/src/widgets/pinterest_menu_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _menuModel(),
      child: Scaffold(
        // body: PinterestGrid(),
        // body: PinterestMenu(),
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuPositioned(),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double lastScrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print('scroll listerner ${controller.offset}');
      if (controller.offset > lastScrollPosition && controller.offset > 200) {
        print('ocultar menu');
        Provider.of<_menuModel>(context, listen: false).showing = false;
      } else {
        print('mostrar menu');
        Provider.of<_menuModel>(context, listen: false).showing = true;
      }

      lastScrollPosition = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: BouncingScrollPhysics(),
      controller: controller,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: new Center(
            // child: new CircleAvatar(
            //   backgroundColor: Colors.white,
            //   child: new Text('$index'),
            // ),
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage('assets/yees.png'),
            fit: BoxFit.contain,
          ),
        )));
  }
}

class _PinterestMenuPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final menuModelProvider = Provider.of<_menuModel>(context);
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return AnimatedPositioned(
        duration: Duration(milliseconds: 250),
        bottom: (menuModelProvider.showing) ? 30 : -100,
        child: Container(
          width: size.width,
          child: Align(
            alignment: Alignment.center,
            child: PinterestMenu(
              showing: menuModelProvider.showing,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.accentColor,
              // backgroundColor: Colors.red,
              // activeColor: Colors.yellow,
              // inactiveColor: Colors.blue,
              items: [
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () {
                      print('primer boton');
                    }),
                PinterestButton(
                    icon: Icons.search,
                    onPressed: () {
                      print('segundo boton');
                    }),
                PinterestButton(
                    icon: Icons.notifications,
                    onPressed: () {
                      print('tercer boton');
                    }),
                PinterestButton(
                    icon: Icons.supervised_user_circle,
                    onPressed: () {
                      print('cuarto boton');
                    }),
              ],
            ),
          ),
        ));
  }
}

class _menuModel with ChangeNotifier {
  bool _showing = true;

  bool get showing => _showing;

  set showing(bool value) {
    _showing = value;
    notifyListeners();
  }
}
