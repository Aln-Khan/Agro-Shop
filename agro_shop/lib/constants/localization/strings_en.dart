class EnStrings {
  static Map<String, String> localizedStrings = {
    'titleOne': 'Discover',
    'descriptionOne': 'Explore cutting-edge agro techniques and technologies to boost your farming efficiency',
    'titleTwo': 'Buy',
    'descriptionTwo': 'Buy fresh produce for your health and seeds for your harvest',
    'titleThree': 'Grow',
    'descriptionThree': 'Find all the tools, equipment, and supplies you need to expand',
  };

  static String getTitle(String key) {
    return localizedStrings[key] ?? '';
  }

  static String getDescription(String key) {
    return localizedStrings[key] ?? '';
  }

  static const String skipText = 'Skip';
}
