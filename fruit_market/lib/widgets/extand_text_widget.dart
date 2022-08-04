import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/small_text.dart';

import 'color.dart';
import 'dimension.dart';

class ExtandTextWidget extends StatefulWidget {
  final String text;

  const ExtandTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExtandTextWidget> createState() => _ExtandTextWidgetState();
}

class _ExtandTextWidgetState extends State<ExtandTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              size: Dimensions.font16,
              text: firstHalf)
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                    color: AppColor.paraColor,
                    size: Dimensions.font16,
                    text: hiddenText
                        ? (firstHalf + '...')
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: 'Show more',
                        color: AppColor.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColor.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
