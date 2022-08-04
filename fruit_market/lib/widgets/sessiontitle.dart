import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/color.dart';

class SessionTitle extends StatelessWidget {
  const SessionTitle({
    Key? key, required this.sessionTitle, required this.salePercent, required this.subTitle,
  }) : super(key: key);

  final String sessionTitle;
  final String salePercent;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height*0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(sessionTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(salePercent,
                  style: TextStyle(
                    color: AppColor.bg,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(subTitle,
              style: const TextStyle(
                    fontSize: 12,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
