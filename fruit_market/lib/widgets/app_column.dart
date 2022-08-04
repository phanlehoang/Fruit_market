import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/small_text.dart';

import 'big_text.dart';
import 'color.dart';
import 'dimension.dart';
import 'icon_and_test_widget.dart';


class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return const Icon(
                  Icons.star,
                  color: AppColor.mainColor,
                  size: 15,
                );
              }),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: '1287'),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: 'Comments')
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Nomarl',
                iconColor: AppColor.iconColor1),
            const SizedBox(
              width: 3,
            ),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: '1.7km',
                iconColor: AppColor.mainColor),
            const SizedBox(
              width: 3,
            ),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32 mins',
                iconColor: AppColor.iconColor2)
          ],
        )
      ],
    );
  }
}

