class Localization {
  static String getSkipText(String language) {
    switch (language) {
      case 'Қазақша':
        return 'Өткізу';
      case 'English':
        return 'Skip';
      case 'Русский':
        return 'Пропустить';
      default:
        return '';
    }
  }
}
