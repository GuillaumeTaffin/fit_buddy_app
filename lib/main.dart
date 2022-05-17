import 'package:fit_buddy_app/fontend/mobile/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dgkfawvhhnebudaxalqd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRna2Zhd3ZoaG5lYnVkYXhhbHFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDUwMTUxNDcsImV4cCI6MTk2MDU5MTE0N30.wdbgbIuRZBdgd2H1FJOU0V5hblKc3vE1LKI8H33JWmQ',
  );
  runApp(const FitBuddyApp());
}

class FitBuddyApp extends StatelessWidget {
  const FitBuddyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIT-BUDDY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
