import 'package:ebuy/core/constant/AppWords.dart';
import 'package:get/get.dart';

class Languages implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //English Language
        'en': AppWords.englishLanguage,

        //Arabic Language
        'ar': AppWords.arabicLanguage
      };
}
