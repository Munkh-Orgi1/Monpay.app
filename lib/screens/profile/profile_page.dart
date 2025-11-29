import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Профайл"), backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: const Center(child: Text("Профайл дэлгэц (placeholder)", style: TextStyle(color: Colors.white, fontSize: 18))),
    );
  }
}
