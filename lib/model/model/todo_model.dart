class ToDoModel {
  // Variables
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? setDueDate;
  String? setDueTime;
  int? setPriority;

  // Constructor
  ToDoModel({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.setDueDate,
    this.setDueTime,
    this.setPriority,
  });

  // Convert ToDo Model into Map
  Map<String, Object?> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'createdAt': createdAt,
        'setDueDate': setDueDate,
        'setDueTime': setDueTime,
        'setPriority': setPriority,
      };

  // Convert to String
  @override
  String toString() =>
      'ToDoModel{id: $id, title: $title, description: $description, createdAt: $createdAt, setDueDate: $setDueDate, setDueTime: $setDueTime, setPriority: $setPriority}';

// // Getter
//   int get Id => _Id;
//   int get setPriority => _setPriority;
//   String get title => _title;
//   String get description => _description;
//   String get createdAt => _createdAt;
//   String get setDueDate => _setDueDate;
//   String get setDueTime => _setDueTime;

// // Setter
//   set description(String value) {
//     this._description = value;
//   }

//   set title(String value) {
//     this._title = value;
//   }

//   set Id(int value) {
//     this._Id = value;
//   }

//   set createdDate(String value) {
//     this._createdAt = value;
//   }

//   set setDueDate(String value) {
//     this._setDueDate = value;
//   }

//   set setDueTime(String value) {
//     this._setDueTime = value;
//   }

//   set setPriority(int value) {
//     this._setPriority = value;
//   }
}
