import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/color.dart';

import '../../../../define/define_images.dart';
import '../authen_phonenumber/home_phone.dart';

class SecondScr extends StatefulWidget {
  const SecondScr({Key? key}) : super(key: key);

  @override
  _SecondScrState createState() => _SecondScrState();
}

class _SecondScrState extends State<SecondScr> {
  int currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                //1st screen
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      margin: const EdgeInsets.all(30),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            _pageController.jumpToPage(2);
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          )),
                    ),
                    Container(
                        width: size.width * 2 / 3,
                        height: size.height * 3 / 10,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Image.asset(
                          AppImg.scr1,
                          fit: BoxFit.fitWidth,
                        )),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "E Shopping",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Explore top organic fruits & grab them",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                //2nd screen
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      margin: const EdgeInsets.all(30),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            _pageController.jumpToPage(2);
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          )),
                    ),
                    Container(
                        width: size.width * 2 / 3,
                        height: size.height * 3 / 10,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Image.asset(
                          AppImg.scr2,
                          fit: BoxFit.fitWidth,
                        )),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Delivery on the way",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Get your order by speed delivery",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                //3rd screen
                Column(
                  children: [
                    Container(
                        width: size.width * 2 / 3,
                        height: size.height * 4 / 7,
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          AppImg.scr3,
                          fit: BoxFit.fitWidth,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Delivery Arrived",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Order is arrived at your Place",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //indicator
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                padding: const EdgeInsets.symmetric(horizontal: 170),
                height: 25,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color:
                            index == currentIndex ? AppColor.bg : Colors.white,
                        border: Border.all(color: AppColor.bg),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    );
                  },
                ),
              ),
              //button
              Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(bottom: 15),
                child: RaisedButton(
                  onPressed: () {
                    if (currentIndex != 2) {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home_phone(),
                          ));
                    }
                  },
                  color: Colors.green[400],
                  child: currentIndex == 2
                      ? Text("Get started",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))
                      : Text("Next",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
