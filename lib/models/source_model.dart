class SourceModel {
  String status;
  List<Sources> sources;
  SourceModel({required this.status, required this.sources});
  SourceModel.fromJson(Map<String, dynamic> json)
      : this(sources: json['sources'], status: json['status']);
}

class Sources {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;
  Sources({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });
  Sources.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          description: json['description'],
          url: json['url'],
          category: json['category'],
          language: json['language'],
          country: json['country'],
        );
}
