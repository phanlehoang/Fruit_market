import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/color.dart';

class Notifications extends StatelessWidget {
  const Notifications({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: AppColor.bg,
      ),
    );
  }
}