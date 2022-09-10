class Tache {
  int? id;
  String name;
  int total;
  int? completed;

  Tache({required this.name, required this.total, completed = 0});

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'name': name,
      'total': total,
      'completed': completed,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  String toString() {
    return 'Tache{id: $id, name: $name, total: $total, completed: $completed}';
  }
}
