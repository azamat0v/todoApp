class PlanModel {
  final String id;
  final String name;
  final DateTime date;
  bool isDone = false;

  PlanModel({required this.id, required this.name, required this.date});

  void toggleDone() {
    isDone = !isDone;
  }
}

class Plans {
  final List<PlanModel> _lists = [
    PlanModel(id: "l1", name: "Dars qilish", date: DateTime.now()),
    PlanModel(id: "l2", name: "Bozorlik qilish", date: DateTime.now()),
    PlanModel(id: "l3", name: "Kitob oqish", date: DateTime.now())
  ];

  List<PlanModel> get lists {
    return _lists;
  }

  List<PlanModel> todoByDay(DateTime date) {
    return _lists
        .where((todo) =>
            todo.date.day == date.day &&
            todo.date.month == date.month &&
            todo.date.year == date.year)
        .toList();
  }

  void todoAdd(String title, DateTime day) {
    _lists.add(PlanModel(id: "l${_lists.length + 1}", name: title, date: day));
  }

  void removeTodo(String id) {
    _lists.removeWhere((list) => list.id == id);
  }
}
