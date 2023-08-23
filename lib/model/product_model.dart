class Product {
  final int id;
  final String name;
  final double price;
  int quantity;
  final String img;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    this.quantity = 1,
  });
}
