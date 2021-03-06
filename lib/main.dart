import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_library/src/presentation/screens/characters_screen.dart';
import 'package:personal_library/src/presentation/screens/comics_screen.dart';
import 'package:personal_library/src/presentation/screens/creators_screen.dart';
import 'package:personal_library/src/presentation/screens/landing_screen.dart';
import 'package:personal_library/src/presentation/screens/listing_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future<FirebaseApp> init = Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: true,
        home: LandingPage(init),
  ));
}

class Home extends StatefulWidget {

  Home({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Personal Library'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            alignment: Alignment.centerRight,
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ]
      ),
      body: GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(left:10, right: 10),
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
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

