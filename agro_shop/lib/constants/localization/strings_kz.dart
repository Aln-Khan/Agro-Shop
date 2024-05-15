class KzStrings {
  static Map<String, String> localizedStrings = {
    'titleOne': 'Зерттеңіз',
    'descriptionOne': 'Агро шаруашылығын тиімділігін арттыру үшін озық агротехнологиялар мен техникаларды зерттеңіз',
    'titleTwo': 'Сатып алыңыз',
    'descriptionTwo': 'Денсаулыққа пайдалы балғын өнімдерді және өзіңіздің бақшаңыз үшін тұқымдарды сатып алыңыз',
    'titleThree': 'Кеңейту',
    'descriptionThree': 'Кеңейтуге қажетті барлық құралдарды, жабдықтарды және керек-жарақтарды табыңыз',
  };

  static String getTitle(String key) {
    return localizedStrings[key] ?? '';
  }

  static String getDescription(String key) {
    return localizedStrings[key] ?? '';
  }

  static const String skipText = 'Өткізу';
}
