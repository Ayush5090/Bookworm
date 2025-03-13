import 'package:hive/hive.dart';
part 'books_model.g.dart';

class BooksModel {
  int? start;
  bool? numFoundExact;
  int? numFound;
  String? documentationUrl;
  String? q;
  int? offset;
  List<Books>? books;

  BooksModel(
      {this.start,
      this.numFoundExact,
      this.numFound,
      this.documentationUrl,
      this.q,
      this.offset,
      this.books});

  BooksModel.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    numFoundExact = json['numFoundExact'];
    numFound = json['num_found'];
    documentationUrl = json['documentation_url'];
    q = json['q'];
    offset = json['offset'];
    if (json['docs'] != null) {
      books = <Books>[];
      json['docs'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['numFoundExact'] = this.numFoundExact;
    data['num_found'] = this.numFound;
    data['documentation_url'] = this.documentationUrl;
    data['q'] = this.q;
    data['offset'] = this.offset;
    if (this.books != null) {
      data['docs'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 0)
class Books extends HiveObject {
  @HiveField(0)
  List<String>? authorKey;
  @HiveField(1)
  List<String>? authorName;
  @HiveField(2)
  String? coverEditionKey;
  @HiveField(3)
  int? coverId;
  @HiveField(4)
  int? editionCount;
  @HiveField(5)
  int? firstPublishYear;
  @HiveField(6)
  bool? hasFulltext;
  @HiveField(7)
  String? key;
  @HiveField(8)
  String? title;

  Books(
      {this.authorKey,
      this.authorName,
      this.coverEditionKey,
      this.coverId,
      this.editionCount,
      this.firstPublishYear,
      this.hasFulltext,
      this.key,
      this.title});

  // Overriding the equality operator (==) for the Books class
  // This ensures that two Books objects with the same coverId are treated as equal.
  @override
  bool operator ==(Object other) {
    // Check if both objects reference the same memory location
    if (identical(this, other)) return true;
    // Check if 'other' is an instance of Books and compare their coverId
    return other is Books && other.coverId == coverId;
  }

  // Overriding the hashCode getter to ensure objects with the same coverId have the same hash
  @override
  int get hashCode => coverId.hashCode;

  Books.fromJson(Map<String, dynamic> json) {
    authorKey = json['author_key']?.cast<String>();
    authorName = json['author_name']?.cast<String>();
    coverEditionKey = json['cover_edition_key'];
    coverId = json['cover_i'] ?? 1;
    editionCount = json['edition_count'];
    firstPublishYear = json['first_publish_year'];
    hasFulltext = json['has_fulltext'];
    key = json['key'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_key'] = this.authorKey;
    data['author_name'] = this.authorName;
    data['cover_edition_key'] = this.coverEditionKey;
    data['cover_i'] = this.coverId;
    data['edition_count'] = this.editionCount;
    data['first_publish_year'] = this.firstPublishYear;
    data['has_fulltext'] = this.hasFulltext;
    data['key'] = this.key;
    data['title'] = this.title;
    return data;
  }
}
