import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'button.dart';
import 'press_count_tracker.dart';

class PresserScreen extends StatelessWidget {
  const PresserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PRESS US !! "),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  key: UniqueKey(),
                  name: "button1",
                ),
                Button(
                  key: UniqueKey(),
                  name: "button2",
                ),
              ],
            ),
          ),
          const PressCountTracker(),
        ],
      ),
    );
  }
}
