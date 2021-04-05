import 'package:carryout/models/MediaImage.dart';
import 'package:carryout/models/Item.dart';

class Menu {
  String id, name, description;
  num price;
  MediaImage image;
  List<Item> defaults, optional;

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];

    if (json['image'] != null) {
      image = new MediaImage.fromJson(json['image']);
    }

    if (json['default'] != null) {
      defaults = <Item>[];

      json['default'].forEach((item) {
        defaults.add(new Item.fromJson(item));
      });
    }

    if (json['optional'] != null) {
      optional = <Item>[];

      json['optional'].forEach((item) {
        optional.add(new Item.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;

    if (this.image != null) {
      data['image'] = this.image.toJson();
    }

    if (this.defaults != null) {
      data['default'] = this.defaults.map((v) => v.toJson()).toList();
    }
    if (this.optional != null) {
      data['optional'] = this.optional.map((v) => v.toJson()).toList();
    }

    return data;
  }
}