import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Common {
  const Common._();

  static Future<void> init() async {
    _checkPlatform();
    await _initializeDb();
  }

  static void _checkPlatform() {
    const appType = String.fromEnvironment('APP_TYPE');

    if (appType == "mobile") {
      if (kIsWeb) {
        throw Exception('This app is only supported on ios or android.');
      }
    }

    if (appType == "admin") {
      if (!kIsWeb) {
        throw Exception('This app is only supported on web.');
      }
    }
  }

  static Future<void> _initializeDb() async {
    const envFile = String.fromEnvironment('env');
    await dotenv.load(fileName: envFile);

    await Supabase.initialize(
      url: dotenv.get("SUPABASE_PROJECT_URL"),
      anonKey: dotenv.get("SUPABASE_API_KEY"),
    );
  }
}
