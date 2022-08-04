import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/color.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Setting'),
        backgroundColor: AppColor.bg,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          buildItem(
              Icon(
                Icons.shield,
                color: AppColor.bg,
                size: 30,
              ),
              'Security',
              size.height * 0.1),
          buildItem(
              Icon(
                Icons.remove_circle,
                color: AppColor.bg,
                size: 30,
              ),
              'Deactive Account',
              size.height * 0.1),
          buildItem(
              Icon(
                Icons.delete,
                color: AppColor.bg,
                size: 30,
              ),
              'Delete Account',
              size.height * 0.1),
        ],
      ),
    );
  }

  Widget buildItem(Icon icon, String title, double height) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
      child: Row(
        children: [
          Container(margin: const EdgeInsets.all(10), child: icon),
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
