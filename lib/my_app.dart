




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/bored_page.dart';
import 'package:river_sample/presentation/ui/presser/button.dart';
import 'package:river_sample/presentation/ui/presser/press_count_tracker.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});


@override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PRESS US !! "),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(key: UniqueKey(),name: "button1",),
                Button(key: UniqueKey(),name: "button2",),
              ],
            ),
          ),
          const PressCountTracker(),
          ElevatedButton(onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BoredPage(),
                  ),
                );
              }, child: const Text("GO TO BORING PAGE"))
        ],
      ),
    );
  }
}


