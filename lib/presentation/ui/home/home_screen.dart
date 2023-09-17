import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/presentation/ui/components/general.dart';
import 'package:river_sample/presentation/ui/home/app_summary.dart';
import 'package:river_sample/shared/named_routes.dart';
import 'package:river_sample/shared/router_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DO SOMETHING !!"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            spaceWidget,
            ElevatedButton(
              onPressed: () {
                ref.watch(appRouterProvider).push(presserRoute);
              },
              child: Text("PRESS SOME BUTTONS ▶️"),
            ),
            spaceWidget,
            ElevatedButton(
              onPressed: () {
                ref.watch(appRouterProvider).push(boredRoute);
              },
              child: Text("GET ACTIVITY IDEAS AND KILL BOREDOM "),
            ),
            const AppSummary(),
          ],
        ),
      ),
    );
  }
}
