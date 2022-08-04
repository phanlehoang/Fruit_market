class CardModel {
  late String image;
  late String name;
  late int price;
  late String description;
  late List<dynamic> nutritions;
  late int id;
  late int rate;
  late int quantity;
  late bool favorite;
  late String detail;
  late String type;
  late String category;

  CardModel(
      {required this.id,
      required this.description,
      this.favorite = false,
      this.rate = 0,
      this.quantity = 0,
      required this.image,
      required this.name,
      required this.price,
      required this.nutritions,
      required this.detail,
      required this.type,
      required this.category});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'description': description,
      'nutritions': nutritions,
      'rate': rate,
      'favorite': favorite,
      'quantity': quantity,
      'detail': detail,
      'type': type,
      'category': category
    };
  }

  CardModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    image = json["image"];
    nutritions = json["nutritions"];
    rate = json["rate"];
    favorite = json["favorite"];
    quantity = json["quantity"];
    detail = json["detail"];
    type = json["type"];
    category = json["category"];
  }

  changeFavorite() {
    favorite = !favorite;
  }

  changeRating(int index) {
    rate = index + 1;
  }
}
