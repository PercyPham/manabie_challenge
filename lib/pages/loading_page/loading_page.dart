import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
