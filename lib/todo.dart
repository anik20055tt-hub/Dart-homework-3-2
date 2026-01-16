class ToDo {
  final String id;
  final String title;
  bool isFinished;
  final String date;

  ToDo({
    required this.id,
    required this.title,
    required this.isFinished,
    required this.date,
  });

  @override
  String toString() {
    return 'ToDo{id: $id, title: $title, isFinished: $isFinished, date: $date}';
  }
}
