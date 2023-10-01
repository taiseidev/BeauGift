import 'package:flutter/material.dart';
import 'package:payment/pages/home_page.dart';

class PaymentPackage extends StatelessWidget {
  const PaymentPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
