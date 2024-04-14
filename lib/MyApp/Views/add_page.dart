// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_project/MyApp/Controllers/add_page_controller.dart';

import 'Widgets/input_text.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final controller = Get.put(HttpPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        title: const Text('Add Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          InputText(
            controller: controller.titleController,
            hint: 'Title',
            fontSize: 30,
          ),
          const SizedBox(height: 10),
          InputText(
            controller: controller.descriptionController,
            hint: 'Description',
            textMinLins: 5,
            textMaxline: 8,
            fontSize: 20,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () => controller.submitData(),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
