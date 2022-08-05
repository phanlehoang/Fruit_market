import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/color.dart';
import 'package:fruit_market/widgets/dimension.dart';
import 'package:provider/provider.dart';
import '../../models/card_model.dart';
import '../../viewmodels/card_view_model.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<CardProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Favorites', style: TextStyle(fontSize: 15)),
          backgroundColor: AppColor.bg),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('favorite').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            var data = snapshot.data!.docs.map((e) => e.data()).toList();
            List<CardModel> favorite = [];
            for (var element in data) {
              favorite.add(CardModel.fromJson(element as Map<String, dynamic>));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "Bạn chưa chọn một món hàng nào",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: favorite.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: Dimensions.height60+2,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey,
                      ))),
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.22,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                favorite[index].image,
                                width: size.width * 0.2,
                                height: size.height * 0.15,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favorite[index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(favorite[index].detail,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                                Row(
                                    children: List.generate(5, (index1) {
                                  return index1 < favorite[index].rate
                                      ? const Icon(
                                          Icons.star,
                                          color:
                                              Color.fromARGB(255, 239, 223, 75),
                                          size: 15,
                                        )
                                      : const Icon(
                                          Icons.star_border,
                                          size: 15,
                                        );
                                })),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        //decrement
                                        favorites.decrement(favorite[index]);
                                        favorites.updateQuantity(
                                            favorite[index].id,
                                            favorite[index].quantity);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
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
                                    Text('${favorite[index].quantity}'),
                                    GestureDetector(
                                      onTap: () {
                                        //increment
                                        favorites.increment(favorite[index]);
                                        favorites.updateQuantity(
                                            favorite[index].id,
                                            favorite[index].quantity);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        width: 25,
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
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${favorite[index].price} Per/Kg",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              RaisedButton(
                                color: AppColor.tab,
                                onPressed: () {
                                  favorites.addtocart(favorite[index]);
                                  favorites.updateQuantity(favorite[index].id,
                                      favorite[index].quantity);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text(
                                  "Add",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
