import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'HomePage.dart';
Future<void> main() async {
  await Supabase.initialize(
    url: 'https://bcabzirdrxpltnunkqrh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJjYWJ6aXJkcnhwbHRudW5rcXJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1NTM4MDIsImV4cCI6MjA0NzEyOTgwMn0.gC12tlErodL-u5gZK4LrDtjRHHgiKvDzzCZrHlSwAr8');
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'perpustakaanApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BookListPage(),
    );
  }
}

