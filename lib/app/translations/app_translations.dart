import 'en_US_translation.dart';
import 'ja_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    "en_US": enUS,
    'ja': ja,
  };
}
