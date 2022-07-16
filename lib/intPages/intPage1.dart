import 'package:flutter/material.dart';

class IntPage1 extends StatelessWidget {
  const IntPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0),
      color: Colors.amber,
      child: const Text('this is the first Page.'),
    );
  }
}
