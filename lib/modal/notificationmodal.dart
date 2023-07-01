import 'package:pocketbase/pocketbase.dart';

class Blognews {
  String category;
  String collectionId;
  String collectionName;
  String content;
  String created;
  String id;
  String image;
  String metadata;
  String name;
  String updated;

  Blognews(
      {required this.category,
      required this.collectionId,
      required this.collectionName,
      required this.content,
      required this.created,
      required this.id,
      required this.image,
      required this.metadata,
      required this.name,
      required this.updated});

  factory Blognews.fromRecord(RecordModel record) => Blognews.fromJson(record.toJson());

  factory Blognews.fromJson(Map<String, dynamic> json) => Blognews(
        category: json['category'] ?? " ",
        collectionId: json['collectionId'] ?? " ",
        collectionName: json["collectionName"] ?? " ",
        content: json['content'] ?? " ",
        created: json['created'] ?? " ",
        id: json['id'] ?? " ",
        image: json['image'] ?? " ",
        metadata: json['metadata'] ?? " ",
        name: json['name'] ?? " ",
        updated: json['updated'] ?? " ",
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['content'] = content;
    data['created'] = created;
    data['id'] = id;
    data['image'] = image;
    data['metadata'] = metadata;
    data['name'] = name;
    data['updated'] = updated;
    return data;
  }
}
