class Product {
  const Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.salesVolume});

  final String id;
  final String title;
  final String description;
  final double price;
  final int salesVolume;
}
