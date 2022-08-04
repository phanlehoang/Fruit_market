import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/color.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Setting'),
        backgroundColor: AppColor.bg,
      ),
    );
  }
}