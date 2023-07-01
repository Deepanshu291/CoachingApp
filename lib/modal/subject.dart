
import 'dart:convert';

class Subject {
  String id;
  String collectionId;
  String collectionName;
  String book;
  String notes;
  String solutions;
  List<String> testpapers;
  String title;

  Subject(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.book,
      required this.notes,
      required this.solutions,
      required this.testpapers,
      required this.title});


  factory Subject.fromRawJson(String str) => Subject.fromJson(json.decode(str));
  String toRaqJson() => json.encode(toJson());

  factory Subject.fromJson(Map<String, dynamic> json) => Subject( 
    id : json['id'] ?? "",
    collectionId : json['collectionId'] ?? "",
    collectionName : json['collectionName'] ?? "",
    book : json['book'] ?? "",
    notes : json['notes'] ?? "",
    solutions : json['solutions'] ?? "",
    testpapers : json['testpapers'].cast<String>() ?? "",
    title : json['title'] ?? "",
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['book'] = book;
    data['notes'] = notes;
    data['solutions'] = solutions;
    data['testpapers'] = testpapers;
    data['title'] = title;
    return data;
  }

  
}
