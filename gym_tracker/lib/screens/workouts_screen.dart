import 'package:flutter/material.dart';
import 'package:gym_tracker/screens/log_workout_screen.dart';
import 'package:gym_tracker/services/db_service.dart';
import 'package:gym_tracker/models/workout.dart';

class WorkoutsScreen extends StatefulWidget {
  @override
  _WorkoutsScreenState createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  List<Workout> workouts = [];

  @override
  void initState() {
    super.initState();
    loadWorkouts();
  }

  void loadWorkouts() async {
    final db = await DBService.database;
    final result = await db.query('workouts');
    setState(() {
      workouts = result.map((map) => Workout.fromMap(map)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick a Workout')),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return ListTile(
            title: Text(workout.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogWorkoutScreen(workoutId: workout.id!)),
              );
            },
          );
        },
      ),
    );
  }
}
