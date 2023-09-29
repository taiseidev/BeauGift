import 'dart:html' as html; // 追加

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payment/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DisplayScreen(),
    );
  }
}

class DisplayScreen extends StatelessWidget {
  // const は削除してコンストラクタ内でdataを初期化
  DisplayScreen({Key? key})
      : data = Uri.parse(html.window.location.href).queryParameters['data'] ??
            "デフォルト値",
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
