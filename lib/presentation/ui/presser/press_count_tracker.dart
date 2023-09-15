import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/presentation/providers/presser/presser.dart';

class PressCountTracker extends ConsumerWidget {
  const PressCountTracker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var presserState = ref.watch(presserProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "BUTTON 1 press count - ${presserState.button1PressCount}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "BUTTON 2 press count - ${presserState.button2PressCount}"),
          ),
        ],
      ),
    );
  }
}