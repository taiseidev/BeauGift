import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payment/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        final data =
            Uri.parse(settings.name ?? "デフォルト値").queryParameters['data'];
        return MaterialPageRoute(
          builder: (context) => DisplayScreen(data: data!),
        );
      },
    );
  }
}

class DisplayScreen extends StatelessWidget {
  final String data;

  const DisplayScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Data')),
      body: Center(child: Text('Data from QR: $data')),
    );
  }
}
