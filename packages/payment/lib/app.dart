import 'package:flutter/material.dart';
import 'package:payment/pages/tip_selection_page.dart';

class PaymentPackage extends StatelessWidget {
  const PaymentPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TipSelectionPage(),
    );
  }
}
