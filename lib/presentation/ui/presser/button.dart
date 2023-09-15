import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/presentation/providers/presser/presser.dart';

class Button extends ConsumerWidget {

  final String name;

  const Button({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateNotifier = ref.read(presserProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          log("${name.toUpperCase()} Pressed ... ");
          stateNotifier.pressButton(name);
        },
        child: Text(name.toUpperCase()),
      ),
    );
  }
}
