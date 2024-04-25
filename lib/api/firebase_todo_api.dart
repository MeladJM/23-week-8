import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

//pwede string if gusto mag return ng success or error message
  Future<String> addTodo(Map<String, dynamic> todo) async {
  try {
    await db.collection("todos").add(todo);
    return "Successfully added todo!";
  } on FirebaseException catch (e) {
  return "Failed with error '${e.code}: ${e.message}";
} 
}
  Future<String> deleteTodo(String id) async {
  try {
    await db.collection("todos").doc(id).delete();
    return "Successfully deleted!";
  } on FirebaseException catch (e) {
  return "Failed with error '${e.code}: ${e.message}";
}
  }

  Future<String> editTodo(String id, String title) async {
  try {
    await db.collection("todos").doc(id).update({"title": title});
    return "Successfully eited!";
  } on FirebaseException catch (e) {
  return "Failed with error '${e.code}: ${e.message}";
}
  }

  Stream<QuerySnapshot>
  getAllTodos() {
    return db.collection
    ("todos").snapshots();
  }


}