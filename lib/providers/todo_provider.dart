/*
  Created by: Claizel Coubeili Cepe
  Date: updated April 26, 2023
  Description: Sample todo app with Firebase 
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:week7_networking_discussion/api/firebase_todo_api.dart';
import '../models/todo_model.dart';

class TodoListProvider with ChangeNotifier {
  FirebaseTodoAPI firebaseService = FirebaseTodoAPI();
  late Stream<QuerySnapshot> _todosStream;

  //fetching data
  TodoListProvider() {
    fetchTodos();
  }
  // getter
  Stream<QuerySnapshot> get todo => _todosStream;

  void fetchTodos(){
    _todosStream = firebaseService.getAllTodos();
    notifyListeners(); //para magreflect sa ui
  }
  void addTodo(Todo item) async {
    // _todoList.add(item);
    String message = await
    firebaseService.addTodo(item.toJson(item));
    print(message);
    notifyListeners();
  }

  void editTodo(String id, String newTitle) async{
    await firebaseService.editTodo(id,newTitle);
    notifyListeners();
  }

  void deleteTodo(String id)  async{
    await firebaseService.deleteTodo(id);
    notifyListeners();
  }
  

  void toggleStatus(int index, bool status) {
    // _todoList[index].completed = status;
    notifyListeners();
  }
}
