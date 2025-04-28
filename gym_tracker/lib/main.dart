import 'package:flutter/material.dart';
import 'package:gym_tracker/screens/home_screen.dart';
import 'package:gym_tracker/services/db_service.dart';
import 'package:gym_tracker/services/seed_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.init();
  await SeedService.seedDefaults();
  
  runApp(GymTrackerApp());
}

class GymTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
