import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());

  await Supabase.initialize(
    url: 'https://aeiiuqyhfpqqbeejvrla.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFlaWl1cXloZnBxcWJlZWp2cmxhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4Mjc1NTAsImV4cCI6MjA4NzQwMzU1MH0.NRIoAKhftmCTCcp8VvbV7rE8Ps-wUDmOavDc_J0VJ-c',
  );

  runApp(const SopnoJoy());
}
