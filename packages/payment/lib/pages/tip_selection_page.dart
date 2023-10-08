import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/pages/indented_bullet_text.dart';
import 'package:theme/colors.dart';

class TipSelectionPage extends StatelessWidget {
  const TipSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "チップ金額の設定",
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
            return const _WebSection();
          }
        },
      ),
    );
  }
}

class _WebSection extends StatelessWidget {
  const _WebSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              'https://cdn.pixabay.com/photo/2021/11/23/13/42/barber-6818707_1280.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Play',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://example.com/path/to/avatar.jpg'),
                radius: 20,
              ),
              SizedBox(width: 10),
              Text('@BOTD'),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Current bid'),
          const Text('0.20 ETH', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.collections, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('The COLLABOR8'),
                ],
              ),
              Text('Auction ends in'),
            ],
          ),
          const Text('16h 0m 7s', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Place bid'),
          ),
        ],
      ),
    );
  }
}

class _MobileSection extends StatelessWidget {
  const _MobileSection();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const _WorkerProfile(),
            const SizedBox(height: 24),
            const _TipButtonsTitle(),
            const SizedBox(height: 16),
            SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.3,
              child: const _TipButtonsSection(),
            ),
            const _Description(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _WorkerProfile extends StatelessWidget {
  const _WorkerProfile();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            "https://cdn.pixabay.com/photo/2021/11/23/13/42/barber-6818707_1280.jpg",
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "affect【アフェクト】",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "佐藤 雄一",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColor.secondary,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.twitter,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _TipButtonsTitle extends StatelessWidget {
  const _TipButtonsTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'チップを選択してください。',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _TipButtonsSection extends StatelessWidget {
  const _TipButtonsSection();

  static const _tipList = [
    100,
    300,
    500,
    1000,
    3000,
    5000,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _tipList.length,
      itemBuilder: (context, index) => _TipButton(amount: _tipList[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3.0,
      ),
    );
  }
}

class _TipButton extends StatelessWidget {
  const _TipButton({required this.amount});

  final int amount;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          children: [
            TextSpan(text: '$amount'),
            const TextSpan(
              text: ' チップ',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
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
            text: "チップは施術者への感謝の気持ちを表すものです。サービスに満足した場合には、適切な金額を選択してください。",
          ),
          SizedBox(height: 4),
          IndentedBulletText(
            text: "チップは任意であり、強制ではありません。ご自身の判断でお選びください。",
          ),
          SizedBox(height: 4),
          Text("・一度送信されたチップは返金できません。"),
          SizedBox(height: 4),
          IndentedBulletText(
            text: "このボタンを押してもすぐには決済されません。最終確認後に決済が完了します。",
          ),
          SizedBox(height: 4),
          IndentedBulletText(
            text: "1チップ = 1円として計算されます。",
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
