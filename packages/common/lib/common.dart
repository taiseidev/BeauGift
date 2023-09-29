import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Common {
  const Common._();

  // MobileとWebで共通の初期化処理
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
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
