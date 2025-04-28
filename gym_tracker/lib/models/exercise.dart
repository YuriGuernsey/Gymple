class Exercise {
  final int? id;
  final int workoutId;
  final String name;

  Exercise({this.id, required this.workoutId, required this.name});

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      workoutId: map['workout_id'],
      name: map['name'],
    );
  }
}
