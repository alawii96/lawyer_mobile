import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  final Widget floatingActionButton;
  final String title;
  const MyScaffold({
    super.key,
    required this.child,
    this.title = "",
    required this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        // margin: EdgeInsets.all(10),
        child: child,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
