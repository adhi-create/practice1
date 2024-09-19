class datamodel {
  final String title;

  datamodel({required this.title});

  factory datamodel.fromJson(Map<String, dynamic> json) {
    return datamodel(title: json['productUrl'] ?? '');
  }
}
