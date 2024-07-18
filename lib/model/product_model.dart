class ProductModel {
  final String image;
  final int rank;
  final String title;
  final List<String> description;
  final double ratingAverage;
  final int ratingCount;
  final List<String> tags;

  ProductModel({
    required this.image,
    required this.rank,
    required this.title,
    required this.description,
    required this.ratingAverage,
    required this.ratingCount,
    required this.tags,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json['image'],
        rank: json['rank'],
        title: json['title'],
        description: json['description'].cast<String>(),
        ratingAverage: json['ratingAverage'],
        ratingCount: json['ratingCount'],
        tags: json['tags'].cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'rank': rank,
        'title': title,
        'description': description,
        'ratingAverage': ratingAverage,
        'ratingCount': ratingCount,
        'tags': tags,
      };
}
