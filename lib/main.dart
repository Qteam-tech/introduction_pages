import 'package:flutter/material.dart';
import 'intPages.dart';

void main(List<String> args) {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntPages(),
    );
  }
}
