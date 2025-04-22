

import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget{
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Page'),
      ),
      body: Center(
        child: Text('This is the story page!'),
      ),
    );
  }
}