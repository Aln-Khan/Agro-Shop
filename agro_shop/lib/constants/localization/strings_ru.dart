class RuStrings {
  static Map<String, String> localizedStrings = {
    'titleOne': 'Откройте для себя',
    'descriptionOne': 'Изучите передовые методы и техники ведения агро хозяйства, чтобы повысить его эффективность',
    'titleTwo': 'Покупайте',
    'descriptionTwo': 'Покупайте свежие продукты и семена для урожая',
    'titleThree': 'Масштаб',
    'descriptionThree': 'Найдите все инструменты, оборудование и принадлежности, необходимые для расширения',
  };

  static String getTitle(String key) {
    return localizedStrings[key] ?? '';
  }

  static String getDescription(String key) {
    return localizedStrings[key] ?? '';
  }

  static const String skipText = 'Пропустить';
}
