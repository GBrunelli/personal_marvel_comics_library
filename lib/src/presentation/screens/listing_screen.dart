import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({Key? key}) : super(key: key);

  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: Text('Log Out'),
        ),
      ),
    );
  }
}
