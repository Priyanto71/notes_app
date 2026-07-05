import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note.dart';

class NoteService {
  // Reference to the 'notes' collection in Firestore
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  // CREATE: Add a new note
  Future<void> addNote(String title, String description) async {
    final note = Note(title: title, description: description);
    await _notesCollection.add(note.toMap());
  }

  // READ: Stream all notes, ordered by newest first
  Stream<List<Note>> getNotes() {
    return _notesCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Note.fromDocument(doc)).toList());
  }

  // UPDATE: Edit an existing note by its document id
  Future<void> updateNote(String id, String title, String description) async {
    await _notesCollection.doc(id).update({
      'title': title,
      'description': description,
    });
  }

  // DELETE: Remove a note by its document id
  Future<void> deleteNote(String id) async {
    await _notesCollection.doc(id).delete();
  }
}
