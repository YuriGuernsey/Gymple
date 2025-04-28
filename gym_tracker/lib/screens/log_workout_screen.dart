import 'package:flutter/material.dart';
import 'package:gym_tracker/models/exercise.dart';
import 'package:gym_tracker/services/db_service.dart';

class LogWorkoutScreen extends StatefulWidget {
  final int workoutId;

  LogWorkoutScreen({required this.workoutId});

  @override
  _LogWorkoutScreenState createState() => _LogWorkoutScreenState();
}

class _LogWorkoutScreenState extends State<LogWorkoutScreen> {
  List<Exercise> exercises = [];
  final weightController = TextEditingController();
  final repsController = TextEditingController();
  final setsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadExercises();
  }

  void loadExercises() async {
    final db = await DBService.database;
    final result = await db.query('exercises', where: 'workout_id = ?', whereArgs: [widget.workoutId]);
    setState(() {
      exercises = result.map((map) => Exercise.fromMap(map)).toList();
    });
  }

  void logExercise(int exerciseId) async {
    final db = await DBService.database;
    final today = DateTime.now().toIso8601String().split('T')[0];

    await db.insert('logs', {
      'exercise_id': exerciseId,
      'weight': double.tryParse(weightController.text) ?? 0,
      'reps': int.tryParse(repsController.text) ?? 0,
      'sets': int.tryParse(setsController.text) ?? 0,
      'date': today,
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Exercise Logged!')));
    weightController.clear();
    repsController.clear();
    setsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log Workout')),
      body: ListView(
        children: exercises.map((ex) {
          return Card(
            child: ListTile(
              title: Text(ex.name),
              subtitle: Column(
                children: [
                  TextField(controller: weightController, decoration: InputDecoration(labelText: 'Weight (kg)')),
                  TextField(controller: repsController, decoration: InputDecoration(labelText: 'Reps')),
                  TextField(controller: setsController, decoration: InputDecoration(labelText: 'Sets')),
                  ElevatedButton(
                    child: Text('Log'),
                    onPressed: () => logExercise(ex.id!),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
