import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Views/todo_list_page.dart';

class HttpPageController extends GetxController {
  @override
  void onInit() {
    getAllData();
    super.onInit();
  }

  RxList items = [].obs;
  RxBool isLoading = false.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> submitData() async {
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    const url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      titleController.text = '';
      descriptionController.text = '';
      // print('Creation success');
      getAllData();
      Get.snackbar('Send Data', 'Creation success',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.6));
      Get.to(() => TodoListPage());
    } else {
      // print('Creation Failed');
      // print(response.body);
      Get.snackbar('Send Data', 'Creation Failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.6));
    }
  }

  Future<void> getAllData() async {
    isLoading.value = true;

    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map;
        final result = json['items'] as List;
        items.value = result;
        // print(response.body);
        // print(response.statusCode);}
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteById(String id) async {
    // Delete the item
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    try {
      if (response.statusCode == 200) {
        // delete from List
        final deleteItem =
            items.where((element) => element['_id'] != id).toList();
        items.value = deleteItem;
        Get.snackbar('Delete Data', 'data hase been deleted',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.6));
      }
    } catch (e) {
      Get.snackbar('Delete Data', 'data failed deleted',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.6));
    }
  }
}
