class Product {
  final int id;
  final String name;
  final double price;
  int quantity; // Add quantity property
  final String img;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    this.quantity = 1, // Initialize quantity to 1
  });
}
