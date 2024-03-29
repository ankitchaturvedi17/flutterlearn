// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  static List<Item> item = [];
  // = [
  //   Item(
  //       id: 1,
  //       name: "name",
  //       desc: "desc",
  //       price: 324,
  //       color: "color",
  //       url:
  //           "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71ZOtNdaZCL._SL1500_.jpg"),
  // ];
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

  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //       id: map['id'],
  //       name: map['name'],
  //       desc: map['desc'],
  //       price: map['price'],
  //       color: map['color'],
  //       url: map['url']);
  // }
  // toMap() => {
  //       "id": id,
  //       "name": name,
  //       "desc": desc,
  //       "price": price,
  //       "color": color,
  //       "url": url,
  //     };

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? url,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'url': url,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? 0,
      color: map['color'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        url.hashCode;
  }
}
