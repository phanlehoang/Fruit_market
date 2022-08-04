import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/card_model.dart';
import '../../viewmodels/card_view_model.dart';
import 'detail_card.dart';

class BuildCard extends StatelessWidget {
  BuildCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  final CardModel card;
  int maxrating = 5;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: size.width * 0.35,
      child: Consumer<CardProvider>(
          builder: (context, value, child) => Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScr(card: card,)),
                          );
                        },
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Hero(
                                tag: Text(card.name),
                                child: Image.asset(
                                  card.image,
                                  width: size.width * 0.32,
                                  height: size.height * 0.23,
                                  fit: BoxFit.cover,
                                ))),
                      ),
                      InkWell(
                        onTap: () {
                          value.changeFavorite(card);
                          if(card.favorite==true){
                            value.addtofavorite(card);
                          }else{
                            value.deletefavorite(card.id);
                          }
                          value.updatefavorite(card.id, card.favorite);
                          
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 5, right: 5),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            !card.favorite
                                ? Icons.favorite_border_outlined
                                : Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            children: List.generate(maxrating, (index) {
                          if (index < card.rate) {
                            return GestureDetector(
                                onTap: () {
                                  value.changeRate(index, card);
                                  value.updaterate(card.id, card.rate);
                                },
                                child: const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.yellow,
                                ));
                          } else {
                            return GestureDetector(
                                onTap: () {
                                  value.changeRate(index, card);
                                  value.updaterate(card.id, card.rate);
                                },
                                child: const Icon(
                                  Icons.star_border_outlined,
                                  size: 18,
                                ));
                          }
                        })),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(card.name),
                        ),
                        Row(
                          children: [
                            Text('₹'),
                            Text('${card.price} Per/Kg')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
    );
  }
}
