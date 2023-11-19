import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app/domain/models/categories_model.dart';
import 'package:notes_app/domain/models/notes_model.dart';

class NoteService {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addNote(NotesModel note, String userToken) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await notesCollection.doc(note.index).set({
        'index': note.index,
        'title': note.title,
        'description': note.description,
        'userId': user.uid,
        'start_time': note.startTime,
        'end_time': note.endTime,
        'date': note.date,
        'category': note.category.category,
        'image': note.category.image,
        'is_complete': note.isComplete,
        'is_over': note.isOver
      });
    }
  }

  Future<void> removeNote(NotesModel note) async {
    await notesCollection.doc(note.index).delete();
  }

  Future<void> updateNote(NotesModel note) async {
    print(notesCollection.doc(note.index));
    await notesCollection.doc(note.index).update({
      'index': note.index,
      'title': note.title,
      'description': note.description,
      'start_time': note.startTime,
      'end_time': note.endTime,
      'date': note.date,
      'category': note.category.category,
      'image': note.category.image,
      'is_complete': note.isComplete,
      'is_over': note.isOver
    });
  }

  Stream<List<NotesModel>> getNotes() {
    User? user = _auth.currentUser;
    print(user?.uid);

    if (user != null) {
      return notesCollection
          .where('userId', isEqualTo: user.uid)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return NotesModel(
            index: doc.id,
            title: doc['title'],
            description: doc['description'],
            startTime: doc['start_time'],
            endTime: doc['end_time'],
            date: doc['date'],
            category:
                CategoriesModel(category: doc['category'], image: doc['image']),
            isComplete: doc['is_complete'],
            isOver: doc['is_over'] ?? false,
          );
        }).toList();
      });
    }

    return Stream.value([]);
  }
}
