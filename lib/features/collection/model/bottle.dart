class Bottle {
  final String id;
  final String name;
  final String year;
  final String imageUrl;
  final String price;

  Bottle({
    required this.id,
    required this.name,
    required this.year,
    required this.imageUrl,
    required this.price,
  });

  factory Bottle.fromJson(Map<String, dynamic> json) {
    return Bottle(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      imageUrl: json['imageUrl'],
      price: json['price'],
    );
  }
}
