import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/color.dart';
import 'account_setting.dart';
import 'change_address.dart';
import 'language_setting.dart';
import 'notification_setting.dart';
class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: AppColor.bg,
        ),
        body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSetting(),));
                },
                  child: buildItem(
                      Icon(
                        Icons.account_circle,
                        color: AppColor.bg,
                        size: 30,
                      ),
                      'Account',
                      size.height * 0.1)),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSetting(),));
                },
                child: buildItem(
                    Icon(
                      Icons.notifications,
                      color: AppColor.bg,
                      size: 30,
                    ),
                    'Notifications',
                    size.height * 0.1),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageSetting(),));
                },
                child: buildItem(
                    Icon(
                      Icons.blur_circular_rounded,
                      color: AppColor.bg,
                      size: 30,
                    ),
                    'Language',
                    size.height * 0.1),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeAddress(),));
                },
                child: buildItem(
                    Icon(
                      Icons.edit_location_sharp,
                      color: AppColor.bg,
                      size: 30,
                    ),
                    'Change Address',
                    size.height * 0.1),
              ),
            ]));
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
