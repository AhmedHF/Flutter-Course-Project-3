import 'package:flutter/material.dart';
import 'package:project_3/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Switch.adaptive(
                        inactiveThumbImage: NetworkImage(
                          "https://user-images.githubusercontent.com/43790152/115108144-419b5680-9f88-11eb-82ea-8ee1af979fa4.png",
                        ),
                        activeThumbImage: NetworkImage(
                          "https://user-images.githubusercontent.com/43790152/115108339-6217e080-9f89-11eb-9869-92dbf8e1476f.png",
                        ),
                        activeColor: Colors.grey[900],
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          final provider = Provider.of<ThemeProvider>(context,
                              listen: false);
                          provider.toggleTheme(value);
                        },
                      ),
                    ),
                  ],
                ),
                Center(
                    child: Text('DSC World', style: TextStyle(fontSize: 36))),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Task 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
