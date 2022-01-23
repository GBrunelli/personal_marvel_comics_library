import 'package:flutter/material.dart';
import 'package:personal_library/src/presentation/screens/characters_screen.dart';
import 'package:personal_library/src/presentation/screens/comics_screen.dart';
import 'package:personal_library/src/presentation/screens/creators_screen.dart';
import 'package:personal_library/src/presentation/screens/listing_screen.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Home(),
  ));
}

class Home extends StatefulWidget {

  List<Widget> charactersWidgets = [];

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ListingScreen(),
    ComicsScreen(),
    CharactersScreen(),
    CreatorsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Comics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_sharp),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_sharp),
            label: 'Creators',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

