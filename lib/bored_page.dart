

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/presentation/ui/presser/button.dart';

class BoredPage extends ConsumerWidget {
  const BoredPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ARE YOU BORED ?"),
      ),
      body: const Center(
        child: Button(name: "button1"),
      ),
    );
  }
}
