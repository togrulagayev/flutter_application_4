import 'package:dio/dio.dart';
import 'package:flutter_application_4/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_4/models/todo_model.dart';

void getDataFromAPI(WidgetRef ref) async {
  try {
    ref.read(todomodelProvider.notifier).update((state) => []);
    final res = await Dio().get('https://jsonplaceholder.typicode.com/todos');
    if (res.statusCode == 200) {
      var data = res.data as List;
      await Future.delayed(const Duration(seconds: 2));
      List<TodoModel> result = data.map((e) => TodoModel.fromJson(e)).toList();

      List<TodoModel> result2 = [];
      for (Map<String, dynamic> mapElement in data) {
        result2.add(TodoModel.fromJson(mapElement));
      }
      ref.read(todomodelProvider.notifier).update((state) => result);
      // ignore: avoid_print
      print(result.length);
    }
  } catch (e) {
    ref
        .read(todomodelProvider.notifier)
        .update((state) => [TodoModel(title: e.toString())]);

    print(e);
  }
}
