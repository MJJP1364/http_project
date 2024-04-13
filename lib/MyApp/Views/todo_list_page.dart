import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_project/MyApp/Views/add_page.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[800],
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(
          () => AddPage(),
          duration: const Duration(milliseconds: 800),
          transition: Transition.fadeIn,
        ),
        label: const Text('Add Todos'),
      ),
    );
  }
}
