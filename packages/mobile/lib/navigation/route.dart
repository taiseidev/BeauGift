import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/main.dart';

part 'route.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
