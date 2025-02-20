enum CoffeeType {
  coldbrew,
  brewdCoffee,
  espresso,
  frappuccino,
  blended,
  tea,
  juice
}

class Coffee {
  final String id;
  final String name;
  final CoffeeType type;
  final String imageUrl;
  final double rating;
  final int participants;
  final String description;
  final double price;

  Coffee({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.rating,
    required this.participants,
    required this.description,
    required this.price,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
      participants: json['participants'],
      description: json['description'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
      'rating': rating,
      'participants': participants,
      'description': description,
      'price': price,
    };
  }
}
