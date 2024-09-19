class Modalvideo {
  final String videoUrl;
  final String ImageUrl;

  Modalvideo({required this.videoUrl, required this.ImageUrl});

  factory Modalvideo.fromJson(Map<String, dynamic> json) {
    return Modalvideo(videoUrl: json[''] ?? '', ImageUrl: json['image1'] ?? '');
  }

  get length => null;
}
