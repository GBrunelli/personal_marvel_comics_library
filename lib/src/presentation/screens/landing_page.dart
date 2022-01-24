import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_library/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:personal_library/firebase_options.dart';
import 'package:personal_library/src/presentation/screens/login_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage(this.init, {Key? key}) : super(key: key);

  Future<FirebaseApp> init;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init,
      builder: (context, snapshot){
        if(snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done){
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                Object? user = snapshot.data;
                if(user == null) {
                  return LoginPage();
                }
                else {
                  return Home();
                }
              }
              return const Scaffold(
                body: Center(
                  child: Text('Loading...'),
                ),
              );
            }
          );
        }
        return const Scaffold(
          body: Center(
            child: Text('Loading...'),
          ),
        );
      }
    );
  }
}
