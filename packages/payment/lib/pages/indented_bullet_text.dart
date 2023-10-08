// TODO(taisei) 2行までしか対応していない
import 'package:flutter/material.dart';

class IndentedBulletText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final String bulletPoint;

  const IndentedBulletText({
    super.key,
    required this.text,
    this.style,
    this.bulletPoint = '・',
  });

  @override
  Widget build(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    final endPositionOfFirstLine = textPainter
        .getPositionForOffset(
          Offset(MediaQuery.of(context).size.width, 0),
        )
        .offset;

    final firstLineText = text.substring(0, endPositionOfFirstLine);
    final restOfText = text.substring(endPositionOfFirstLine);

    return Text('$bulletPoint$firstLineText\n　$restOfText');
  }
}
