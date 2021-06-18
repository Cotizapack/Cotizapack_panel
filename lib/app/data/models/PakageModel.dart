// To parse this JSON data, do
//
//     final pakageclass = pakageclassFromMap(jsonString);

import 'dart:convert';

class Pakageclass {
  Pakageclass({
    this.id,
    this.collection,
    this.permissions,
    this.name = "",
    this.description = "",
    this.quotations = 0,
    this.image = "",
    this.price = 0,
    this.onSale = false,
    this.percentage = 0,
    this.enable = true,
    this.createAt = 0,
    this.updatedAt = 0,
    this.expirationPromo = 0,
  });

  String? id;
  String? collection;
  Permissions? permissions;
  String? name;
  String? description;
  int? quotations;
  String? image;
  int? price;
  bool? onSale;
  int? percentage;
  bool? enable;
  int? createAt;
  int? updatedAt;
  int? expirationPromo;

  factory Pakageclass.fromJson(String str) =>
      Pakageclass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pakageclass.fromMap(Map<String, dynamic> json) => Pakageclass(
        id: json["\u0024id"],
        collection: json["\u0024collection"],
        permissions: Permissions.fromMap(json["\u0024permissions"]),
        name: json["name"],
        description: json["description"],
        quotations: json["quotations"],
        image: json["image"],
        price: json["price"],
        onSale: json["onSale"],
        percentage: json["percentage"],
        enable: json["enable"],
        createAt: json["create_at"],
        updatedAt: json["updated_at"],
        expirationPromo: json["expirationPromo"],
      );

  Map<String, dynamic> toMap() => {
        "\u0024id": id,
        "\u0024collection": collection,
        "\u0024permissions": permissions?.toMap(),
        "name": name,
        "description": description,
        "quotations": quotations,
        "image": image,
        "price": price,
        "onSale": onSale,
        "percentage": percentage,
        "enable": enable,
        "create_at": createAt,
        "updated_at": updatedAt,
        "expirationPromo": expirationPromo,
      };
}

class Permissions {
  Permissions({
    this.read,
    this.write,
  });

  List<String>? read;
  List<String>? write;

  factory Permissions.fromJson(String str) =>
      Permissions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Permissions.fromMap(Map<String, dynamic> json) => Permissions(
        read: List<String>.from(json["read"].map((x) => x)),
        write: List<String>.from(json["write"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "read": List<dynamic>.from(read!.map((x) => x)),
        "write": List<dynamic>.from(write!.map((x) => x)),
      };
}
