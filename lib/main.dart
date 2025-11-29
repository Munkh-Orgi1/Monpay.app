import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';

void main() {
  runApp(const MonPayClone());
}

class MonPayClone extends StatelessWidget {
  const MonPayClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
