import 'package:flutter/material.dart';

class ExerciseLogger extends StatelessWidget {
  final String exerciseName;
  final TextEditingController weightController;
  final TextEditingController repsController;
  final TextEditingController setsController;
  final VoidCallback onSave;

  ExerciseLogger({
    required this.exerciseName,
    required this.weightController,
    required this.repsController,
    required this.setsController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exerciseName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
            ),
            TextField(
              controller: repsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Reps'),
            ),
            TextField(
              controller: setsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sets'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onSave,
              child: Text('Save Set'),
            )
          ],
        ),
      ),
    );
  }
}
