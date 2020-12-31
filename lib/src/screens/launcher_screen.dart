import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/routes/routes.dart';
import 'package:flutter_pinterest/src/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: _MainMenu(),
      body: _OptionsList(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
        separatorBuilder: (BuildContext context, i) => Divider(
          color: appTheme.primaryColorLight,
        ),
        itemCount: pageRoutes.length,
        itemBuilder: (context, i) => ListTile(
          leading: FaIcon(
            pageRoutes[i].icon, color: appTheme.accentColor,
          ),
          title: Text(pageRoutes[i].titulo),
          trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page ));
          },
        ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text('DH', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),
            Expanded(
                child: _OptionsList()
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: appTheme.currentTheme.accentColor,),
              title: Text('Modo oscuro'),
              trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  activeColor: appTheme.currentTheme.accentColor,
                  onChanged: (value) {
                    appTheme.darkTheme = value;
                  }
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: appTheme.currentTheme.accentColor,),
                title: Text('Tema personalizado'),
                trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    activeColor: appTheme.currentTheme.accentColor,
                    onChanged: (value) {
                      appTheme.customTheme = value;
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

