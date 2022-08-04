import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/define/define_texts.dart';
import 'package:fruit_market/mvvm/models/card_model.dart';
import 'package:fruit_market/mvvm/viewmodels/card_view_model.dart';
import 'package:fruit_market/mvvm/views/tab/cards.dart';
import 'package:fruit_market/widgets/dimension.dart';
import 'package:fruit_market/widgets/sessiontitle.dart';
import 'package:provider/provider.dart';

class DryFruitTab extends StatelessWidget {
  const DryFruitTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    String search = provider.searchKey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimensions.height20),
        SessionTitle(
            sessionTitle: ConstText.indehiscent,
            salePercent: ConstText.sale10,
            subTitle: ConstText.des_indehiscent),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'indehiscent')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'indehiscent')
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
        const SizedBox(height: 20),
        SessionTitle(
            sessionTitle: ConstText.mix_dryfruits_pack,
            salePercent: ConstText.sale5,
            subTitle: ConstText.des_mixdryfruitpack),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'mixeddryfruits')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'mixeddryfruits')
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
        SessionTitle(
            sessionTitle: ConstText.dehiscent,
            salePercent: ConstText.sale15,
            subTitle: ConstText.des_dehiscent),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'dehiscent')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'dehiscent')
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
        SessionTitle(
            sessionTitle: ConstText.kashmiri,
            salePercent: ConstText.sale20,
            subTitle: ConstText.des_kashmiri),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: (search != '' && search != null)
                  ? FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'kashmiri')
                      .where('name', isEqualTo: search)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('products')
                      .where('type', isEqualTo: 'kashmiri')
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
