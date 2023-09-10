import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/todo_model.dart';
import 'package:flutter_application_4/providers/providers.dart';
import 'package:flutter_application_4/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoModel>? listTodoModel = ref.watch(todomodelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: listTodoModel == null
                  ? const Text('hi')
                  : listTodoModel.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : listTodoModel.length == 1
                          ? Center(
                              child: Text(
                                  'error code: \n ${listTodoModel[0].title}'),
                            )
                          : ListView.builder(
                              itemCount: listTodoModel.length,
                              itemBuilder: (context, index) => Card(
                                child: ListTile(
                                  subtitle: Text(
                                    listTodoModel[index].title ?? 'null',
                                  ),
                                  title: Text(
                                    listTodoModel[index].id.toString(),
                                  ),
                                  trailing: Icon(listTodoModel[index].completed!
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_unchecked),
                                ),
                              ),
                            ),
            ),
            TextButton(
              onPressed: () {
                getDataFromAPI(ref);
              },
              child: const Text('Get Data From API'),
            ),
          ],
        ),
      ),
    );
  }
}
