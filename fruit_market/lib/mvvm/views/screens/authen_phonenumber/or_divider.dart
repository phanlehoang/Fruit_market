import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/color.dart';



class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30.0),
            child: Text(
              "OR",
              style:
                  TextStyle(color: AppColor.text_bar, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 600,
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function() press;

  const SocialIcon({Key? key, required this.iconSrc, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColor.text_bar),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
