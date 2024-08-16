import 'package:get/get.dart';
import 'languages/arabic.dart';
import 'languages/english.dart';
import 'languages/french.dart';


class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'fr_FR': French.french,
        'en_US': English.english,
        'ar_AR': Arabic.arabic,
        // Add more languages here
      };
}
