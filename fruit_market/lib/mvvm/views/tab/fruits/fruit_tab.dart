import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/dimension.dart';
import 'package:fruit_market/widgets/sessiontitle.dart';

import 'package:provider/provider.dart';

import '../../../../define/define_texts.dart';
import '../../../models/card_model.dart';
import '../../../viewmodels/card_view_model.dart';
import '../cards.dart';

class FruitTab extends StatelessWidget {
  const FruitTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    String search = provider.searchKey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        SessionTitle(
            sessionTitle: ConstText.organicfruit,
            salePercent: ConstText.sale20,
            subTitle: ConstText.description_organicfruit),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'organicfruit')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'organicfruit')
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
        //mixed fruit
        const SizedBox(height: 20),
        SessionTitle(
            sessionTitle: ConstText.mixfruitpack,
            salePercent: ConstText.sale10,
            subTitle: ConstText.description_mixfruitpack),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'mixedfruit')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'mixedfruit')
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
        //stone fruits
        SizedBox(height: Dimensions.height20),
        SessionTitle(
            sessionTitle: ConstText.stonefruit,
            salePercent: ConstText.sale20,
            subTitle: ConstText.description_stonefruit),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '')
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'stonefruits')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'stonefruits')
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
        // melons
        const SizedBox(height: 20),
        SessionTitle(
            sessionTitle: ConstText.melon,
            salePercent: ConstText.sale20,
            subTitle: ConstText.description_melon),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '')
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'melonfruits')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'melonfruits')
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
