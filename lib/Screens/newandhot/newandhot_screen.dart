import 'package:flutter/material.dart';
import 'package:hotstar/Screens/newandhot/tapbar_screen.dart';

class HotScreen extends StatefulWidget {
  const HotScreen({super.key});

  @override
  State<HotScreen> createState() => _HotScreenState();
}

class _HotScreenState extends State<HotScreen> {
  @override
  Widget build(BuildContext context) {
    return const MyTabbedScreen();
  }
}
