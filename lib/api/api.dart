class Book {
  String? id;
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  String? language;
  String? smallThumbnail;
  String? thumbnail;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.language,
    required this.smallThumbnail,
    required this.thumbnail,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      authors: List<String>.from(json['authors'] ?? []),
      publisher: json['publisher'],
      publishedDate: json['publishedDate'] ?? '',
      description: json['description'] ?? '',
      language: json['language'] ?? '',
      smallThumbnail: json['smallThumbnail'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      previewLink: json['previewLink'] ?? '',
      infoLink: json['infoLink'] ?? '',
      canonicalVolumeLink: json['canonicalVolumeLink'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['authors'] = this.authors;
    data['publisher'] = this.publisher;
    data['publishedDate'] = this.publishedDate;
    data['description'] = this.description;
    data['language'] = this.language;
    data['smallThumbnail'] = this.smallThumbnail;
    data['thumbnail'] = this.thumbnail;
    data['previewLink'] = this.previewLink;
    data['infoLink'] = this.infoLink;
    data['canonicalVolumeLink'] = this.canonicalVolumeLink;
    return data;
  }
}
