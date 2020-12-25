import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool showing;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu(
      {this.showing = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey,
      @required this.items
      });

  // final List<PinterestButton> items = [
  //   PinterestButton(
  //       icon: Icons.pie_chart,
  //       onPressed: () {
  //         print('primer boton');
  //       }),
  //   PinterestButton(
  //       icon: Icons.search,
  //       onPressed: () {
  //         print('segundo boton');
  //       }),
  //   PinterestButton(
  //       icon: Icons.notifications,
  //       onPressed: () {
  //         print('tercer boton');
  //       }),
  //   PinterestButton(
  //       icon: Icons.supervised_user_circle,
  //       onPressed: () {
  //         print('cuarto boton');
  //       }),
  // ];

  //
  // PinterestMenu({this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        opacity: (this.showing) ? 1 : 0,
        duration: Duration(milliseconds: 150),
        child: _PinterestMenuBackground(
          backgroundColor: this.backgroundColor,
          child: _MenuItems(
            menuItems: items,
            activeColor: this.activeColor,
            inactiveColor: this.inactiveColor,
          ),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  _PinterestMenuBackground(
      {@required this.child, this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: this.backgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                // offset: Offset(10, 10),
                blurRadius: 10,
                spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  final Color activeColor;
  final Color inactiveColor;
  _MenuItems(
      {this.menuItems,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) => _PinterestMenuButton(
              index, menuItems[index], this.activeColor, this.inactiveColor)),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  final Color activeColor;
  final Color inactiveColor;

  _PinterestMenuButton(
      this.index, this.item, this.activeColor, this.inactiveColor);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = Provider.of<_MenuModel>(context).selectedIndex;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedIndex = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: 25,
          color:
              (selectedIndex == index) ? this.activeColor : this.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
