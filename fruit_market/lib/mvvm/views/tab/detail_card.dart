import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/dimension.dart';

import 'package:provider/provider.dart';

import '../../models/card_model.dart';
import '../../viewmodels/card_view_model.dart';
import '../screens/shoppingcart_screen.dart';

class DetailsScr extends StatelessWidget {
  final CardModel card;

  const DetailsScr({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addtocart = Provider.of<CardProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: const Text('DETAILS'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Hero(
                    tag: card.name,
                    child: Image.asset(
                      card.image,
                      width: size.width * 0.92,
                      height: size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                card.name,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  card.detail,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Nutrition",
                style: TextStyle(fontSize: Dimensions.font26),
              ),
              Column(
                children: [
                  for (int i = 0; i < card.nutritions.length; i++)
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.grey[600],
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              card.nutritions[i],
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                            ))
                      ],
                    ),
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.price_check_outlined,
                  ),
                  Text(
                    '${card.price} Per/Kg',
                    style: const TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: Dimensions.width15 * 10,
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    height: Dimensions.height45,
                    child: RaisedButton(
                      color: Colors.lightGreen[600],
                      onPressed: () {
                        addtocart.addtocart(card);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingCart()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
