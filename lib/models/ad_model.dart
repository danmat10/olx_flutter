class Ad {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final String location;
  final DateTime datePosted;
  final String advertiser;

  Ad({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.location,
    required this.datePosted,
    required this.advertiser,
  });

  Ad.withoutId({
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.location,
    required this.datePosted,
    required this.advertiser,
  }) : id = '';

  factory Ad.fromMap(Map<String, dynamic> map) {
    return Ad(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      images: List<String>.from(map['images']),
      location: map['location'],
      datePosted: DateTime.fromMillisecondsSinceEpoch(map['datePosted']),
      advertiser: map['advertiser'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'images': images,
      'location': location,
      'datePosted': datePosted.millisecondsSinceEpoch,
      'advertiser': advertiser,
    };
  }
}
