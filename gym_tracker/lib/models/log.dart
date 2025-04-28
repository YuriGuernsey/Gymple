class Log {
  final int? id;
  final int exerciseId;
  final double weight;
  final int reps;
  final int sets;
  final String date;

  Log({
    this.id,
    required this.exerciseId,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.date,
  });

  factory Log.fromMap(Map<String, dynamic> map) {
    return Log(
      id: map['id'],
      exerciseId: map['exercise_id'],
      weight: map['weight'],
      reps: map['reps'],
      sets: map['sets'],
      date: map['date'],
    );
  }
}
