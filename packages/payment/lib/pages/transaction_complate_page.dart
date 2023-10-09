import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payment/pages/indented_bullet_text.dart';
import 'package:theme/colors.dart';

class TransactionCompletePage extends StatelessWidget {
  const TransactionCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "あなたの思い、届けました！",
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
            return const _MobileSection();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _MobileSection extends StatelessWidget {
  const _MobileSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Lottie.asset(
          'assets/json/success.json',
          width: 150,
        ),
        const SizedBox(height: 24),
        const Text(
          "感謝の気持ち、無事に届けました！\n施術者もあなたの思いに感謝しています。",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
        const _Description(),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: _PaymentMethodButton(
            text: 'アプリをダウンロード',
            onPressed: () {},
          ),
        ),
      ],
    );
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
            text: "チップは施術者への感謝の表現として提供されます。返金やキャンセルは原則として受け付けておりませんので、ご了承ください。",
          ),
          SizedBox(height: 4),
          IndentedBulletText(
            text: "私たちのアプリをダウンロードして、さらに快適な体験を得られます！",
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
