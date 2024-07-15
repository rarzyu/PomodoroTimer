import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

/// テキスト＋アイコンボタン
class TextIconButtonComponent extends StatelessWidget {
  final Text text;
  final Icon icon;
  final Function onPressed;
  final double width;

  TextIconButtonComponent({
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () => onPressed(),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        depth: 2.5,
      ),
      child: Container(
        width: width.toDouble(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            text,
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 2),
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
