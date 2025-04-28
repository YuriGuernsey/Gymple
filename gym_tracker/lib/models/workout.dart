class Workout {
  final int? id;
  final String name;

  Workout({this.id, required this.name});

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      name: map['name'],
    );
  }
}
