class MenuCard {
  String imgUrl;
  String title;
  String des;
  int toPrice;

  MenuCard(
      {required this.imgUrl,
      required this.title,
      required this.des,
      required this.toPrice});

  MenuCard.fromMap(Map<String, dynamic> map)
      : imgUrl = map["image"],
        title = map["name"],
        des = map["description"],
        toPrice = map["price"];
}
