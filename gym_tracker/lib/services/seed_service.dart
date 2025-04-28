import 'package:gym_tracker/services/db_service.dart';

class SeedService {
  static Future<void> seedDefaults() async {
    final db = await DBService.database;
    var existing = await db.query('workouts');

    if (existing.isEmpty) {
      int pushId = await db.insert('workouts', {'name': 'Push Day'});
      int pullId = await db.insert('workouts', {'name': 'Pull Day'});
      int legId = await db.insert('workouts', {'name': 'Leg Day'});

      await db.insert('exercises', {'name': 'Bench Press', 'workout_id': pushId});
      await db.insert('exercises', {'name': 'Shoulder Press', 'workout_id': pushId});
      await db.insert('exercises', {'name': 'Deadlift', 'workout_id': pullId});
      await db.insert('exercises', {'name': 'Barbell Row', 'workout_id': pullId});
      await db.insert('exercises', {'name': 'Squat', 'workout_id': legId});
      await db.insert('exercises', {'name': 'Leg Press', 'workout_id': legId});
    }
  }
}
