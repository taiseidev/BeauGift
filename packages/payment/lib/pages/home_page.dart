import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : data =
            Uri.parse(window.location.href).queryParameters['data'] ?? "デフォルト値",
        super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Data')),
      body: Center(child: Text('Data from QR: $data')),
    );
  }
}
