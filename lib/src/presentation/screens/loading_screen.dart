import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.blueGrey,
            size: 50,
          ),
        )
    );
  }
}


