import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : data =
            Uri.parse(window.location.href).queryParameters['data'] ?? "デフォルト値",
        super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text('QR Data'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await fetchAndOpenUrl();
              },
              child: const Text("PayPayで支払う"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchAndOpenUrl() async {
    const apiUrl =
        'https://us-central1-beau-gift-dev.cloudfunctions.net/api/paypay/oneTapCall';

    // ヘッダーの設定
    final headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'Your-User-Agent-Here'
    };

    // リクエストのbody
    final body = json.encode({
      'amount': 2000,
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    final responseBody = json.decode(response.body);

    final url = responseBody['url'];
    print(url);

    if (await canLaunchUrl(Uri.parse(url as String))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('Could not launch $url');
    }
    // if (response.statusCode == 200) {
    // } else {
    //   print('Error occurred: ${response.statusCode}');
    // }
  }

  Future<void> fetchApi() async {
    const apiUrl =
        'https://us-central1-beau-gift-dev.cloudfunctions.net/api/paypay/oneTapCall';

    // ヘッダーの設定
    final headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'Your-User-Agent-Here'
    };

    // リクエストのbody
    final body = json.encode({
      'amount': 2000,
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    print(response.body);
  }
}
