import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String? id;
  final String title;
  final String description;
  final Timestamp? createdAt;

  Note({
    this.id,
    required this.title,
    required this.description,
    this.createdAt,
  });

  // Convert a Note object into a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }

  // Create a Note object from a Firestore document
  factory Note.fromMap(String id, Map<String, dynamic> map) {
    return Note(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      createdAt: map['createdAt'],
    );
  }

  factory Note.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Note.fromMap(doc.id, data);
  }
}
