import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment/pages/payment_selection_page.dart';
import 'package:payment/pages/tip_selection_page.dart';
import 'package:payment/pages/transaction_complate_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) => GoRouter(
      initialLocation: '/tip-selection',
      debugLogDiagnostics: true,
      routes: $appRoutes,
    );

@TypedGoRoute<TipSelectionRoute>(
  path: '/tip-selection',
  routes: [
    TypedGoRoute<PaymentSelectionRoute>(
      path: 'payment-selection/:amount',
    ),
  ],
)
class TipSelectionRoute extends GoRouteData {
  const TipSelectionRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => TipSelectionPage();
}

class PaymentSelectionRoute extends GoRouteData {
  const PaymentSelectionRoute({required this.amount});

  final int amount;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      PaymentSelectionPage(amount: amount);
}

@TypedGoRoute<TransactionCompleteRoute>(
  path: '/transaction-complete',
)
class TransactionCompleteRoute extends GoRouteData {
  const TransactionCompleteRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TransactionCompletePage();
}
