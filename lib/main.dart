import 'package:fit_buddy_app/backend/auth/auth_bloc.dart';
import 'package:fit_buddy_app/backend/auth/auth_repository.dart';
import 'package:fit_buddy_app/backend/workouts/workouts_bloc.dart';
import 'package:fit_buddy_app/backend/workouts/workouts_repository.dart';
import 'package:fit_buddy_app/frontend/mobile/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'frontend/mobile/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dgkfawvhhnebudaxalqd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRna2Zhd3ZoaG5lYnVkYXhhbHFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDUwMTUxNDcsImV4cCI6MTk2MDU5MTE0N30.wdbgbIuRZBdgd2H1FJOU0V5hblKc3vE1LKI8H33JWmQ',
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(AuthRepositorySupabase())),
        BlocProvider(create: (context) => WorkoutsBloc(WorkoutsRepositorySupabase())),
      ],
      child: const FitBuddyApp(),
    ),
  );
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
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return const HomePage();
          }
          return AuthPage();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
