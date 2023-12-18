class ProductModel {
  int id;
  String brand;
  String name;
  String price;
  String imageLink;
  String description;
  double? rating;
  String category;
  String productType;
  List<ProductColors>? productColors;

  ProductModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.productColors,
    required this.imageLink,
    required this.description,
    this.rating,
    required this.category,
    required this.productType,
  });

  factory ProductModel.fromJson(dynamic json) => ProductModel(
        id: json['id'],
        brand: json['brand'],
        name: json['name'],
        price: json['price'],
        imageLink: json['image_link'],
        description: json['description'],
        rating: json['rating'],
        category: json['category'],
        productType: json['product_type'],
        productColors: List<ProductColors>.from(
            json["product_colors"]?.map((x) => ProductColors?.fromJson(x))),
      );
}

class ProductColors {
  String? color;

  ProductColors({
    this.color,
  });

  factory ProductColors.fromJson(Map<String, dynamic> json) => ProductColors(
        color: json["hex_value"],
      );
}
