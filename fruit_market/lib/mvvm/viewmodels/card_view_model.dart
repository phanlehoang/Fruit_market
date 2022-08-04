import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/card_model.dart';

class CardProvider extends ChangeNotifier {
  var fruit = FirebaseFirestore.instance.collection("products");
  var favorite = FirebaseFirestore.instance.collection("favorite");
  var cart = FirebaseFirestore.instance.collection("cart");
  String search = '';

  Future addtofavorite(CardModel card) async {
    await favorite.add({
      'id': card.id,
      'image': card.image,
      'name': card.name,
      'price': card.price,
      'description': card.description,
      'nutritions': card.nutritions,
      'rate': card.rate,
      'favorite': card.favorite,
      'quantity': card.quantity,
      'detail': card.detail,
      'type': card.type,
      'category': card.category
    });
  }

  Future deletefavorite(int id) async {
    await favorite.where('id', isEqualTo: id).get().then((querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            element.reference.delete();
          })
        });
  }

  Future addtocart(CardModel card) async {
    await cart.where('id', isEqualTo: card.id).get().then((value) => {
          if (value.size > 0)
            {
              value.docs.forEach((element) {
                element.reference.update({'quantity': card.quantity++});
              })
            }
          else
            {
              cart.add({
                'id': card.id,
                'image': card.image,
                'name': card.name,
                'price': card.price,
                'description': card.description,
                'nutritions': card.nutritions,
                'rate': card.rate,
                'favorite': card.favorite,
                'quantity': card.quantity,
                'detail': card.detail,
                'type': card.type,
                'category': card.category
              })
            }
        });
  }

  Future deletecart(int id) async {
    await cart.where('id', isEqualTo: id).get().then((querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            element.reference.delete();
          })
        });
  }

  Future updatefavorite(int id, bool isfavorite) async {
    await fruit.where('id', isEqualTo: id).get().then((querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            element.reference.update({'favorite': isfavorite});
          })
        });
  }

  Future updaterate(int id, int rate) async {
    await fruit.where('id', isEqualTo: id).get().then((querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            element.reference.update({'rate': rate});
          })
        });
    await favorite.where('id', isEqualTo: id).get().then((querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            element.reference.update({'rate': rate});
          })
        });
    await cart.where('id', isEqualTo: id).get().then((querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            element.reference.update({'rate': rate});
          })
        });
  }

  Future updateQuantity(int id, int quantity) async {
    await favorite.where('id', isEqualTo: id).get().then((querySnapshot) => {
          querySnapshot.docs.forEach((element) {
            element.reference.update({'quantity': quantity});
          })
        });
    await cart.where('id', isEqualTo: id).get().then((value) => {
          value.docs.forEach((element) {
            element.reference.update({'quantity': quantity});
          })
        });
  }

  Future deleteAll() async {
    await cart.get().then((value) => {
          value.docs.forEach((element) {
            element.reference.delete();
          })
        });
  }

  changeFavorite(CardModel card) {
    card.changeFavorite();
    notifyListeners();
  }

  changeRate(int index, CardModel card) {
    card.changeRating(index);
    notifyListeners();
  }

  increment(CardModel card) {
    if (card.quantity >= 0) {
      card.quantity++;
    }
    notifyListeners();
  }

  decrement(CardModel card) {
    if (card.quantity > 0) {
      card.quantity--;
    } else {
      card.quantity = 0;
    }
    notifyListeners();
  }

  getSearchResult(String key) {
    search = key;
    notifyListeners();
  }

  String get searchKey => search;
}
