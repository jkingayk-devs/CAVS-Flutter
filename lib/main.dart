import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_screen.dart';
import 'screens/admin_dashboard.dart';
import 'services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CAVSApp());
}

class CAVSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAVS - Smart Mini Store',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
      routes: {
        '/admin': (context) => AdminDashboard(),
      },
    );
  }
}
