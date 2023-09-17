import 'package:go_router/go_router.dart';
import 'package:river_sample/presentation/ui/boring/boring_screen.dart';
import 'package:river_sample/presentation/ui/home/home_screen.dart';
import 'package:river_sample/presentation/ui/presser/presser_screen.dart';
import 'package:river_sample/shared/named_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
class AppRouter extends _$AppRouter {
  @override
  GoRouter build() => GoRouter(
        routes: [
          GoRoute(
            path: homeRoute,
            builder: (context, state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: presserRoute,
            builder: (context, state) {
              return const PresserScreen();
            },
          ),
          GoRoute(
            path: boredRoute,
            builder: (context, state) {
              return const BoringScreen();
            },
          ),
          GoRoute(
            path: availableActivitiesRoute,
            builder: (context, state) {
              return const HomeScreen();
            },
          ),
        ],
      );
}
