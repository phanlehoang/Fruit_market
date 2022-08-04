import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/color.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool switched1 = false;
  bool switched2 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Setting'),
        backgroundColor: Colors.lightGreen[600],
        elevation: 0,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: size.height * 0.1,
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
            child: ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.lightGreen[600],
                size: 30,
              ),
              title: Text('My Account'),
              subtitle: Text('You will receive daily updates'),
              trailing: Switch(
                value: switched1,
                onChanged: (value) {
                  setState(() {
                    switched1 = value;
                  });
                },
                activeColor: Colors.lightGreen[600],
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
            child: ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.lightGreen[600],
                size: 30,
              ),
              title: Text('Pramotional Notifacations'),
              subtitle: Text('You will receive daily updates'),
              trailing: Switch(
                value: switched2,
                onChanged: (value) {
                  setState(() {
                    switched2 = value;
                  });
                },
                activeColor: AppColor.bg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
