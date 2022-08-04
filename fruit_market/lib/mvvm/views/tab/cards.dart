import 'package:flutter/material.dart';
import 'package:fruit_market/mvvm/models/card_model.dart';

import 'build_card.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key, required this.card, 

  }) : super(key: key);
  final CardModel card;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: BuildCard(card: card),
    );
  }
}
