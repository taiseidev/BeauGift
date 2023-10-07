import 'package:flutter/material.dart';
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
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;

          if (width > 600.0) {
            width = 600.0;
          }

          return Center(
            child: SizedBox(
              width: width,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  SizedBox(
                    height: height * 0.4,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: _TipButtonsSection(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const _TipSumSection(),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: _ConfirmButton(),
                  ),
                ],
              ),
            ),
          );
        },
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
    10000,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _tipList.length,
      itemBuilder: (context, index) => _TipButton(
        amount: _tipList[index],
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 5.0,
      ),
    );
  }
}

class _TipSumSection extends StatelessWidget {
  const _TipSumSection();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: '合計 ',
          ),
          TextSpan(
              text: '3300',
              style: TextStyle(
                fontSize: 32,
              )),
          TextSpan(
            text: 'tip',
          ),
        ],
      ),
    );
  }
}

class _TipButton extends StatelessWidget {
  const _TipButton({
    required this.amount,
  });

  final int amount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Text(
          "+$amount tip",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        alignment: Alignment.center,
        child: const Text(
          "決定",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
