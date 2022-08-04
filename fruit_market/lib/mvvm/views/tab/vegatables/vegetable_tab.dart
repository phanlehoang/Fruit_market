import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/define/define_texts.dart';
import 'package:fruit_market/mvvm/models/card_model.dart';
import 'package:fruit_market/mvvm/viewmodels/card_view_model.dart';
import 'package:fruit_market/mvvm/views/tab/cards.dart';

import 'package:fruit_market/widgets/dimension.dart';
import 'package:fruit_market/widgets/sessiontitle.dart';
import 'package:provider/provider.dart';

class VegetableTab extends StatelessWidget {
  const VegetableTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    String search = provider.searchKey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimensions.height10),
        const SessionTitle(
            sessionTitle: ConstText.organic_vegetable,
            salePercent: ConstText.sale10,
            subTitle: ConstText.des_organic_vegetable),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'organicvegetables')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'organicvegetables')
                      .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                var items = snapshot.data!.docs.map((e) => e.data()).toList();
                List<CardModel> data = [];
                for (var element in items) {
                  data.add(CardModel.fromJson(element as Map<String, dynamic>));
                }
                return Row(children: [
                  for (int i = 0; i < data.length; i++) Cards(card: data[i])
                ]);
              }),
        ),
        SizedBox(height: Dimensions.height20),
        const SessionTitle(
            sessionTitle: ConstText.mix_vegetable_pack,
            salePercent: ConstText.sale5,
            subTitle: ConstText.mix_vegetable_pack),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'mixedvegetables')
                      .where('name', arrayContains: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'mixedvegetables')
                      .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                var items = snapshot.data!.docs.map((e) => e.data()).toList();
                List<CardModel> data = [];
                for (var element in items) {
                  data.add(CardModel.fromJson(element as Map<String, dynamic>));
                }
                return Row(
                  children: [
                    for (int i = 0; i < data.length; i++) Cards(card: data[i])
                  ],
                );
              }),
        ),
        SizedBox(height: Dimensions.height20),
        const SessionTitle(
            sessionTitle: ConstText.Allium_vegetable,
            salePercent: ConstText.sale15,
            subTitle: ConstText.des_alliumvegetable),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'alliumvegetables')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'alliumvegetables')
                      .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                var items = snapshot.data!.docs.map((e) => e.data()).toList();
                List<CardModel> data = [];
                for (var element in items) {
                  data.add(CardModel.fromJson(element as Map<String, dynamic>));
                }
                return Row(
                  children: [
                    for (int i = 0; i < data.length; i++) Cards(card: data[i])
                  ],
                );
              }),
        ),
        SizedBox(height: Dimensions.height20),
        const SessionTitle(
            sessionTitle: ConstText.root_vegetable,
            salePercent: ConstText.sale20,
            subTitle: ConstText.des_rootvegetable),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'rootvegetables')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'rootvegetables')
                      .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                var items = snapshot.data!.docs.map((e) => e.data()).toList();
                List<CardModel> data = [];
                for (var element in items) {
                  data.add(CardModel.fromJson(element as Map<String, dynamic>));
                }
                return Row(
                  children: [
                    for (int i = 0; i < data.length; i++) Cards(card: data[i])
                  ],
                );
              }),
        ),
      ],
    );
  }
}
