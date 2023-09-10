class TodoModel {
  int? id;
  String? title;
  bool? completed;

  TodoModel({this.id, this.title, this.completed});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
}
