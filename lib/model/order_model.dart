class OrderModel {
  int? id;
  String? title;
  String? description;
  String? price;
  String? img;
  int count = 0;
  //RxInt count = 0.obs; // Use a private variable for count

  OrderModel({this.id, this.title, this.description, this.price, this.img});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['img'] = this.img;

    return data;
  }
}
