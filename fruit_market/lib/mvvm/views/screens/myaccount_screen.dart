import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/mvvm/views/screens/payment/payment_page.dart';
import 'package:fruit_market/mvvm/views/screens/shoppingcart_screen.dart';

import 'package:fruit_market/service/signup_signin/screen/register_screen.dart';
import 'package:fruit_market/widgets/color.dart';
import 'package:fruit_market/widgets/dimension.dart';

import '../../../widgets/display_image_widget.dart';
import '../tab//help.dart';
import '../tab//myorder.dart';
import '../tab//setting.dart';
import 'edit_image.dart';
import 'favourite_screen.dart';
import 'user/user_data.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = UserData.myUser;
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('user').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: Dimensions.height75,
                        width: size.width,
                        color: AppColor.bg,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      navigateSecondPage(EditImagePage());
                                    },
                                    child: DisplayImage(
                                      imagePath: user.image,
                                      onPressed: () {},
                                    )),
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Email',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                              right: 10,
                              top: Dimensions.height30,
                              child: GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.edit_calendar,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentPage(),
                                  ));
                            },
                            child: buildItem(
                                const Icon(Icons.shopping_bag_rounded,
                                    size: 30, color: AppColor.bg),
                                'My Orders',
                                size.height * 0.1),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Favourite(),
                                  ));
                            },
                            child: buildItem(
                                const Icon(Icons.favorite,
                                    size: 30, color: AppColor.bg),
                                'Favourites',
                                size.height * 0.1),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Setting(),
                                  ));
                            },
                            child: buildItem(
                                const Icon(Icons.settings,
                                    size: 30, color: AppColor.bg),
                                'Settings',
                                size.height * 0.1),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShoppingCart(),
                                  ));
                            },
                            child: buildItem(
                                const Icon(Icons.shopping_cart,
                                    size: 30,
                                    color: Color.fromARGB(255, 116, 165, 60)),
                                'My Cart',
                                size.height * 0.1),
                          ),
                          buildItem(
                              ImageIcon(
                                const AssetImage('assets/icons/rate.png'),
                                color: Colors.lightGreen[600],
                                size: 30,
                              ),
                              'Rate us',
                              size.height * 0.1),
                          buildItem(
                              const Icon(Icons.share,
                                  size: 30,
                                  color: Color.fromARGB(255, 116, 165, 60)),
                              'Refer a Friend',
                              size.height * 0.1),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Help(),
                                  ));
                            },
                            child: buildItem(
                                const Icon(Icons.help,
                                    size: 30,
                                    color: Color.fromARGB(255, 116, 165, 60)),
                                'Help',
                                size.height * 0.1),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ));
                            },
                            child: buildItem(
                                const Icon(Icons.logout,
                                    size: 30,
                                    color: Color.fromARGB(255, 116, 165, 60)),
                                'Log Out',
                                size.height * 0.1),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              })),
    );
  }

  Widget buildItem(dynamic icon, String title, double height) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
      child: Row(
        children: [
          Container(margin: const EdgeInsets.all(10), child: icon),
          Text(
            title,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
