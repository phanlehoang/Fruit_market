import 'package:flutter/material.dart';
import 'package:fruit_market/service/firebase_helper.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../../../define/define_images.dart';
import '../../../../define/define_texts.dart';
import '../../../../widgets/dimension.dart';
import 'loading_screen.dart';

class Home_phone extends StatefulWidget {
  const Home_phone({Key? key}) : super(key: key);

  @override
  State<Home_phone> createState() => _Home_phoneState();
}

class _Home_phoneState extends State<Home_phone> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Image.asset(
                AppImg.logo,
                scale: 0.8,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: const Text(
                  'Fruit Market',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 40),
                ),
              ),
              Column(children: [
                Container(
                  width: Dimensions.width20,
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    decoration: const InputDecoration(
                      prefix: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text('+1'),
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      hintText: 'Enter your mobile number',
                    ),
                    onSubmitted: (value) async {
                      final login = await FireBaseHelper()
                          .login(phone: phoneController.text);
                      if (login == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoadingScr(
                                    phone: phoneController.text,
                                  )),
                        );
                      }
                    },
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
