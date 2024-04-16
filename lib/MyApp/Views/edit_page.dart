import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/add_page_controller.dart';
import 'Widgets/input_text.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key});
  final controller = Get.find<HttpPageController>();

  final id = Get.arguments['id'];
  final title = Get.arguments['title'];
  final description = Get.arguments['description'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        title: const Text('Edit Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          InputText(
            controller: controller.titleController,
            hint: title,
            fontSize: 30,
          ),
          const SizedBox(height: 10),
          InputText(
            controller: controller.descriptionController,
            hint: description,
            textMinLins: 5,
            textMaxline: 8,
            fontSize: 20,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () => controller.editById(id),
              child: const Text(
                'Update',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
