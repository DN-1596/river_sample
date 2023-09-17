import 'package:flutter/material.dart';
import 'package:river_sample/presentation/ui/boring/activity_form_ui.dart';
import 'package:river_sample/presentation/ui/boring/new_activity_list.dart';

class BoringScreen extends StatelessWidget {
  const BoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ARE YOU BORED?"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ActivityFormUI(),
          Expanded(child: NewActivityList()),
        ],
      ),
    );
  }
}
