import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/index.dart';

class PressCountTracker extends ConsumerWidget {
  const PressCountTracker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var presserState = ref.watch(presserProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        color: Colors.grey.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "PRESS COUNTS",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "BUTTON 1 - ${presserState.button1PressCount}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "BUTTON 2 - ${presserState.button2PressCount}"),
            ),
          ],
        ),
      ),
    );
  }
}
