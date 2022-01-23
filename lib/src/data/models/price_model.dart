class PriceModel {
  PriceModel({
    required this.type,
    required this.price,
  });
  late final String type;
  late final double price;

  PriceModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    price = json['price'].toDouble();
  }
}