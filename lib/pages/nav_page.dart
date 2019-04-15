import 'package:flutter/material.dart';


class NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航"),
      ),
      body: Center(
        child: Text("This is nav"),
      ),
    );
  }
}