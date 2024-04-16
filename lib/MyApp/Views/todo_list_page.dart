import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_project/MyApp/Views/add_page.dart';
import 'package:http_project/MyApp/Views/edit_page.dart';

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
                : getAllDataController.items.isEmpty
                    ? const Center(
                        child: Text(
                          'No data',
                          style: TextStyle(fontSize: 35),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: getAllDataController.getAllData,
                        child: ListView.builder(
                          itemCount: getAllDataController.items.length,
                          itemBuilder: (context, index) {
                            final items = getAllDataController.items[index];
                            final id = items['_id'] as String;
                            final title = items['title'] as String;
                            final description = items['description'] as String;

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            ' ${index + 1}',
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            items['title'],
                                            style:
                                                const TextStyle(fontSize: 25),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            items['description'],
                                            style:
                                                const TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      PopupMenuButton(
                                        onSelected: (value) {
                                          if (value == 'Edit') {
                                            Get.to(
                                              () => EditPage(),
                                              
                                              arguments: {
                                                'id': id,
                                                'title': title,
                                                'description': description,
                                              },
                                              duration: const Duration(
                                                  milliseconds: 800),
                                              transition: Transition.fadeIn,
                                            );
                                          } else if (value == 'Delete') {
                                            getAllDataController.deleteById(id);
                                          }
                                        },
                                        itemBuilder: (context) {
                                          return [
                                            const PopupMenuItem(
                                              value: 'Edit',
                                              child: Text('Edit'),
                                            ),
                                            const PopupMenuItem(
                                              value: 'Delete',
                                              child: Text('Delete'),
                                            ),
                                          ];
                                        },
                                      )
                                    ],
                                  ),
                                ),
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
