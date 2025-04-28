import 'package:flutter/material.dart';
import 'package:gym_tracker/screens/workouts_screen.dart';
import 'package:gym_tracker/services/db_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Today\'s Workout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No workout logged yet.', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Pick a Workout'),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WorkoutsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
