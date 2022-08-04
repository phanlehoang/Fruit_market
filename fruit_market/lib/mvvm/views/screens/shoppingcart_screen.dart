import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/mvvm/views/screens/payment/payment_page.dart';
import 'package:fruit_market/widgets/color.dart';
import 'package:fruit_market/widgets/dimension.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:provider/provider.dart';

import '../../models/card_model.dart';
import '../../viewmodels/card_view_model.dart';
import '../tab//change_address.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CardProvider>(context);
    var stream1 = FirebaseFirestore.instance
        .collection('cart')
        .where('category', isEqualTo: 'fruit')
        .snapshots();
    var stream2 = FirebaseFirestore.instance
        .collection('cart')
        .where('category', isEqualTo: 'vegetable')
        .snapshots();
    var stream3 = FirebaseFirestore.instance
        .collection('cart')
        .where('category', isEqualTo: 'dryfruits')
        .snapshots();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: const Text('Shopping Cart', style: TextStyle(fontSize: 15)),
            backgroundColor: AppColor.bg),
        body: StreamBuilder3<QuerySnapshot, QuerySnapshot, QuerySnapshot>(
          streams: Tuple3(stream1, stream2, stream3),
          builder: (context, snapshot) {
            var fruit = snapshot.item1.data!.docs.map((e) => e.data()).toList();
            int sum = 0;
            List<CardModel> fruits = [];
            for (var element in fruit) {
              fruits.add(CardModel.fromJson(element as Map<String, dynamic>));
            }
            if (fruits.isNotEmpty) {
              for (int i = 0; i < fruits.length; i++) {
                sum += fruits[i].price * fruits[i].quantity;
              }
            }
            var vegetable =
                snapshot.item2.data!.docs.map((e) => e.data()).toList();
            List<CardModel> vegetables = [];
            for (var element in vegetable) {
              vegetables
                  .add(CardModel.fromJson(element as Map<String, dynamic>));
            }
            if (vegetables.isNotEmpty) {
              for (int j = 0; j < vegetables.length; j++) {
                sum += vegetables[j].price * vegetables[j].quantity;
              }
            }
            var dryfruit =
                snapshot.item3.data!.docs.map((e) => e.data()).toList();
            List<CardModel> dryfruits = [];
            for (var element in dryfruit) {
              dryfruits
                  .add(CardModel.fromJson(element as Map<String, dynamic>));
            }
            if (dryfruits.isNotEmpty) {
              for (int k = 0; k < dryfruits.length; k++) {
                sum += dryfruits[k].price * dryfruits[k].quantity;
              }
            }
            if (!(snapshot.item1.hasData &&
                    snapshot.item2.hasData &&
                    snapshot.item3.hasData) ||
                (snapshot.item1.data!.docs.isEmpty &&
                    snapshot.item2.data!.docs.isEmpty &&
                    snapshot.item3.data!.docs.isEmpty)) {
              return const Center(
                child: Text("You don't have any order"),
              );
            } else {
              return Stack(children: [
                SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.location_on),
                          Container(
                              width: size.width * 0.5,
                              child: const Text(
                                'Address',
                                overflow: TextOverflow.ellipsis,
                              )),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.keyboard_arrow_down),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChangeAddress(),
                                  ));
                            },
                            child: const Text(
                              'Change Address',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: size.height * 0.05,
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color: Colors.grey[300],
                      child: const Text(
                        'Fruits',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: fruits.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          height: size.height * 0.17,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.1,
                          ))),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.22,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    fruits[index].image,
                                    width: size.width * 0.2,
                                    height: size.height * 0.15,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(fruits[index].name),
                                    ),
                                    Text('${fruits[index].price} Per/Kg')
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        provider.deletecart(fruits[index].id);
                                      },
                                      child: Icon(Icons.delete_rounded)),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          //decrement
                                          provider.decrement(fruits[index]);
                                          provider.updateQuantity(
                                              fruits[index].id,
                                              fruits[index].quantity);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: const Center(
                                            child: Icon(
                                              Icons.remove,
                                              size: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text('${fruits[index].quantity}'),
                                      GestureDetector(
                                        onTap: () {
                                          //increment
                                          provider.increment(fruits[index]);
                                          provider.updateQuantity(
                                              fruits[index].id,
                                              fruits[index].quantity);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: Dimensions.width30,
                                          height: Dimensions.height30,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    //vegetables
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: Dimensions.height45,
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color: Colors.grey[300],
                      child: const Text(
                        'Vegetables',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: vegetables.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          height: Dimensions.height60,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.1,
                          ))),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.22,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    vegetables[index].image,
                                    width: size.width * 0.2,
                                    height: size.height * 0.15,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: Dimensions.height10),
                                      child: Text(vegetables[index].name),
                                    ),
                                    Text('${vegetables[index].price} Per/Kg')
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        provider
                                            .deletecart(vegetables[index].id);
                                      },
                                      child: const Icon(Icons.delete_rounded)),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          //decrement
                                          provider.decrement(vegetables[index]);
                                          provider.updateQuantity(
                                              vegetables[index].id,
                                              vegetables[index].quantity);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: const Center(
                                            child: Icon(
                                              Icons.remove,
                                              size: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text('${vegetables[index].quantity}'),
                                      GestureDetector(
                                        onTap: () {
                                          //increment
                                          provider.increment(vegetables[index]);
                                          provider.updateQuantity(
                                              vegetables[index].id,
                                              vegetables[index].quantity);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              size: Dimensions.font16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    //dry fruits
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: Dimensions.height45,
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color: Colors.grey[300],
                      child: const Text(
                        'Dry Fruits',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dryfruits.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          height: Dimensions.height20,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.1,
                          ))),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.22,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    dryfruits[index].image,
                                    width: size.width * 0.2,
                                    height: size.height * 0.15,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                width: Dimensions.width10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(dryfruits[index].name),
                                    ),
                                    Text('${dryfruits[index].price} Per/Kg')
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        provider
                                            .deletecart(dryfruits[index].id);
                                      },
                                      child: const Icon(Icons.delete_rounded)),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          //decrement
                                          provider.decrement(dryfruits[index]);
                                          provider.updateQuantity(
                                              dryfruits[index].id,
                                              dryfruits[index].quantity);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: const Center(
                                            child: Icon(
                                              Icons.remove,
                                              size: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text('${dryfruits[index].quantity}'),
                                      GestureDetector(
                                        onTap: () {
                                          //increment
                                          provider.increment(dryfruits[index]);
                                          provider.updateQuantity(
                                              dryfruits[index].id,
                                              dryfruits[index].quantity);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: Dimensions.width10,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: const Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      height: size.height * 0.1,
                    )
                  ]),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total- $sum',
                          style: const TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          child: RaisedButton(
                            color: Colors.lightGreen[600],
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentPage()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              "Place Order",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]);
            }
          },
        ));
  }
}
