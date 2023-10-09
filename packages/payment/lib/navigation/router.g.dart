// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $tipSelectionRoute,
      $transactionCompleteRoute,
    ];

RouteBase get $tipSelectionRoute => GoRouteData.$route(
      path: '/tip-selection',
      factory: $TipSelectionRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'payment-selection/:amount',
          factory: $PaymentSelectionRouteExtension._fromState,
        ),
      ],
    );

extension $TipSelectionRouteExtension on TipSelectionRoute {
  static TipSelectionRoute _fromState(GoRouterState state) =>
      const TipSelectionRoute();

  String get location => GoRouteData.$location(
        '/tip-selection',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PaymentSelectionRouteExtension on PaymentSelectionRoute {
  static PaymentSelectionRoute _fromState(GoRouterState state) =>
      PaymentSelectionRoute(
        amount: int.parse(state.pathParameters['amount']!),
      );

  String get location => GoRouteData.$location(
        '/tip-selection/payment-selection/${Uri.encodeComponent(amount.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $transactionCompleteRoute => GoRouteData.$route(
      path: '/transaction-complete',
      factory: $TransactionCompleteRouteExtension._fromState,
    );

extension $TransactionCompleteRouteExtension on TransactionCompleteRoute {
  static TransactionCompleteRoute _fromState(GoRouterState state) =>
      const TransactionCompleteRoute();

  String get location => GoRouteData.$location(
        '/transaction-complete',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'd6dfc511b2db06161ef765b329b4505f6147ae83';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
