import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:payment/pages/indented_bullet_text.dart';
import 'package:theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentSelectionPage extends StatelessWidget {
  const PaymentSelectionPage({
    super.key,
    required this.amount,
  });

  final int amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          "決済方法を選択",
          style: TextStyle(
            color: AppColor.secondary,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return _MobileSection(amount);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _MobileSection extends StatefulWidget {
  const _MobileSection(this.amount);

  final int amount;

  @override
  State<_MobileSection> createState() => _MobileSectionState();
}

class _MobileSectionState extends State<_MobileSection> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${widget.amount}チップ",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                  const Icon(
                    Icons.double_arrow_rounded,
                    size: 24,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2021/11/23/13/42/barber-6818707_1280.jpg",
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Divider(
                height: 3,
              ),
              const SizedBox(height: 16),
              const Text(
                '決済方法を選択してください。',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              _PaymentMethodButton(
                text: "PayPayを選択",
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await fetchAndOpenUrl();
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              const SizedBox(height: 16),
              _PaymentMethodButton(
                text: "クレジットカードを選択",
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              const _Description(),
            ],
          ),
        ),
        Visibility(
          visible: isLoading,
          child: ColoredBox(
            color: Colors.black26,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            ),
          ),
        )
      ],
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

    if (await canLaunchUrl(Uri.parse(url as String))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint('Could not launch $url');
    }

    if (response.statusCode == 200) {
    } else {
      debugPrint('Error occurred: ${response.statusCode}');
    }
  }
}

class _PaymentMethodButton extends StatelessWidget {
  const _PaymentMethodButton({
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // ここの値を調整して、角の丸みの大きさを変更できます。
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const DefaultTextStyle(
      style: TextStyle(
        fontSize: 10,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IndentedBulletText(
            text:
                "私たちの決済パートナーであるPayPayとStripeは、高度なセキュリティ対策を持つ決済サービスです。安心してご利用ください。",
          ),
          SizedBox(height: 4),
          IndentedBulletText(
            text: "決済手続きの一部は、PayPayやStripeの外部サイトで行われます。外部サイトの指示に従って操作を行ってください。",
          ),
          SizedBox(height: 4),
          IndentedBulletText(
            text:
                "決済途中でエラーや問題が発生した場合は、最初から手続きをやり直してください。何度も問題が発生する場合は、別の決済方法をお試しいただくか、サポートセンターにご連絡ください。",
          ),
          SizedBox(height: 4),
          IndentedBulletText(
            text:
                "一度完了した決済の返金やキャンセルは、一部の条件下でのみ受け付けられます。詳細な規定は当社の返金ポリシーをご参照ください。",
          ),
          SizedBox(height: 4),
          IndentedBulletText(
            text:
                "PayPayでの決済時、手数料としてチップの10%が追加されます。例: 300のチップを渡す場合、手数料¥30が追加となり、合計¥330となります。",
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
