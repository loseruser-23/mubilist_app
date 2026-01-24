class Artikel {
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? sourceName;

  Artikel({
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    required this.sourceName,
  });

  factory Artikel.fromJson(Map<String, dynamic> json) {
    return Artikel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      sourceName: json['source']?['name'] as String,
    );
  }
}
