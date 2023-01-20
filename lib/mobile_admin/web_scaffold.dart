import 'package:flutter/material.dart';

class WebScaffold extends StatelessWidget {
  final Widget body;
  const WebScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: body,
        ),
      ),
    );
  }
}
