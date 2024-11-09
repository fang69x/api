class ProductModel {
  ProductModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<Datum> data;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.onSale,
    required this.salePercent,
    required this.sold,
    required this.sliderNew,
    required this.sliderRecent,
    required this.sliderSold,
    required this.date,
    required this.title,
    required this.categories,
    required this.subcat,
    required this.shop,
    required this.price,
    required this.saleTitle,
    required this.salePrice,
    required this.description,
    required this.color,
    required this.size,
    required this.inWishlist,
    required this.images,
  });

  final String? id;
  final bool? onSale;
  final int? salePercent;
  final int? sold;
  final bool? sliderNew;
  final bool? sliderRecent;
  final bool? sliderSold;
  final String? date;
  final String? title;
  final Categories? categories;
  final Categories? subcat;
  final Shop? shop;
  final String? price;
  final String? saleTitle;
  final String? salePrice;
  final String? description;
  final String? color;
  final String? size;
  final bool? inWishlist;
  final List<Image> images;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["_id"],
      onSale: json["on_sale"],
      salePercent: json["sale_percent"],
      sold: json["sold"],
      sliderNew: json["slider_new"],
      sliderRecent: json["slider_recent"],
      sliderSold: json["slider_sold"],
      date: json["date"],
      title: json["title"],
      categories: json["categories"] == null
          ? null
          : Categories.fromJson(json["categories"]),
      subcat:
          json["subcat"] == null ? null : Categories.fromJson(json["subcat"]),
      shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
      price: json["price"],
      saleTitle: json["sale_title"],
      salePrice: json["sale_price"],
      description: json["description"],
      color: json["color"],
      size: json["size"],
      inWishlist: json["in_wishlist"],
      images: json["images"] == null
          ? []
          : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    );
  }
}

class Categories {
  Categories({
    required this.id,
    required this.type,
    required this.salePercent,
    required this.date,
    required this.name,
    required this.image,
  });

  final String? id;
  final String? type;
  final int? salePercent;
  final String? date;
  final String? name;
  final String? image;

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json["_id"],
      type: json["type"],
      salePercent: json["sale_percent"],
      date: json["date"],
      name: json["name"],
      image: json["image"],
    );
  }
}

class Image {
  Image({
    required this.id,
    required this.url,
  });

  final String? id;
  final String? url;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["id"],
      url: json["url"],
    );
  }
}

class Shop {
  Shop({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.shopemail,
    required this.shopaddress,
    required this.shopcity,
    required this.userid,
    required this.image,
  });

  final String? id;
  final bool? isActive;
  final String? createdAt;
  final String? name;
  final String? description;
  final String? shopemail;
  final String? shopaddress;
  final String? shopcity;
  final String? userid;
  final String? image;

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json["_id"],
      isActive: json["is_active"],
      createdAt: json["created_At"],
      name: json["name"],
      description: json["description"],
      shopemail: json["shopemail"],
      shopaddress: json["shopaddress"],
      shopcity: json["shopcity"],
      userid: json["userid"],
      image: json["image"],
    );
  }
}
