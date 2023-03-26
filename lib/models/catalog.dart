class CatalogModel {
  static final item = [
    Item(
        id: 1,
        name: "name",
        desc: "desc",
        price: 324,
        color: "color",
        url:
            "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71ZOtNdaZCL._SL1500_.jpg"),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String url;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.url});
}
