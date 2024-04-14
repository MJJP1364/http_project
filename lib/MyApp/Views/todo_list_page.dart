import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_project/MyApp/Views/add_page.dart';

import '../Controllers/add_page_controller.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  final getAllDataController = Get.put(HttpPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[800],
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      // ignore: unrelated_type_equality_checks
      body: Obx(() {
        return
            // ignore: unrelated_type_equality_checks
            getAllDataController.isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: getAllDataController.getAllData,
                    child: ListView.builder(
                      itemCount: getAllDataController.items.length,
                      itemBuilder: (context, index) {
                        final items = getAllDataController.items[index];
                        return Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                ' ${index + 1}',
                                style: const TextStyle(fontSize: 25),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                items['title'],
                                style: const TextStyle(fontSize: 25),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                items['description'],
                                style: const TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
      }),
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
