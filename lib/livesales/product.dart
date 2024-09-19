class Productlive {
  final int id;
  final String name;
  final String whatsap;
  final String image;
  final String? url; // Nullable

  Productlive({
    required this.id,
    required this.name,
    required this. whatsap,
    required this.image,
    this.url, // Nullable field
  });

  factory Productlive.fromJson(Map<String, dynamic> json) {
    return Productlive(
      id: json['id'] ?? 0, // Default value if null
      name: json['video'] ?? 'No Name', 
      whatsap: json['whatsapp'] ?? 'No Name', // Default value if null
      image: json['image'] ?? '', // Default value if null
      url: json['url'] as String?, // Cast url to a nullable String
    );
  }
}
