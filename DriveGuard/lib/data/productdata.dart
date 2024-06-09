class CarProduct {
  CarProduct(
      {required this.product_id,
      required this.product_name,
      required this.price,
      required this.description,
      required this.category,
      required this.imgUrl,
      this.prioirty,
      this.reviews});

  String product_id;
  String product_name;
  int price;
  String description;
  String category;
  int? prioirty;
  String imgUrl;
  List<dynamic>? reviews;

  // factory CarProduct.fromJson(Map<String, dynamic> json) {
  //   return CarProduct(
  //     product_id: json['_id'],
  //     product_name: json['product_name'],
  //     price: json['price'],
  //     description: json['description'],
  //     category: json['category'],
  //     imgUrl: json['imgUrl'],
  //     prioirty: json['priority'] ?? 0,
  //   );
  // }
}
