class ReportModel {
  String name;
  String phone;
  String address;
  String price;
  ReportModel(
      {required this.name,
      required this.phone,
      required this.address,
      required this.price});
  factory ReportModel.fromJson(dynamic data) => ReportModel(
      name: data['name'],
      phone: data['phone'],
      address: data['address'],
      price: data['price']);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'price': price,
    };
  }
}
