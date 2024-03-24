class ToDoModel {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? setDueDate;
  String? setDueTime;
  int? setPriority;

  ToDoModel({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.setDueDate,
    this.setDueTime,
    this.setPriority,
  });

  ToDoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    createdAt = json['createdAt'];
    setDueDate = json['setDueDate'];
    setDueTime = json['setDueTime'];
    setPriority = json['setPriority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['setDueDate'] = setDueDate;
    data['setDueTime'] = setDueTime;
    data['setPriority'] = setPriority;

    return data;
  }
}
