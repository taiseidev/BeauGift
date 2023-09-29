import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Common {
  const Common._();

  static Future<void> initializeDb() async {
    const envFile = String.fromEnvironment('env');
    await dotenv.load(fileName: envFile);

    await Supabase.initialize(
      url: dotenv.get("SUPABASE_PROJECT_URL"),
      anonKey: dotenv.get("SUPABASE_API_KEY"),
    );
  }
}
