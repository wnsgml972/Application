import 'package:flutter/material.dart';

// TODO : 연결할 파일 import
import 'resource/design/ColorPalette.dart';
import 'Home.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: MainColorPalette.primaryColor,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainMenu(title: 'Coffee Street'),
    );
  }
}


class MainMenu extends StatefulWidget {
  MainMenu({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<MainMenu> {
  int _curMenuIndex = 2;
  final List<Widget> _childMenuList = [
    // TODO : Add new Widgets (functional screen)
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.deepPurple),
    HomePage(),
    PlaceholderWidget(Colors.greenAccent),
    PlaceholderWidget(Colors.black),
  ];

  void _OnTabTapped(int index) {
    setState(() {
      _curMenuIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 100.0,
            backgroundColor: MainColorPalette.monoWhite,
            title: Text(
              'Koffee Street',
              style: TextStyle(
                color:MainColorPalette.primaryColor,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications, color: MainColorPalette.primaryColor,),
                onPressed: () { }, // TODO : Do write a redirect event
                tooltip: 'Notifications',
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: _childMenuList[_curMenuIndex],
          ),
//          child:,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _OnTabTapped,
        currentIndex: _curMenuIndex,

        // Set Items
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text('Menu'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('My'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Event'),
          ),
        ],

        // Set Theme
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: MainColorPalette.monoWhite,
        unselectedItemColor: MainColorPalette.monoGray,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO : Do write a redirect event
        tooltip: 'My Cart',
        child: Icon(Icons.add_shopping_cart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 200.0,
      color: color,
    );
  }
}