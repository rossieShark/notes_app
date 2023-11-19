enum AppFonts { chloe, versailles }

extension AppFontsExtension on AppFonts {
  String get font {
    switch (this) {
      case AppFonts.chloe:
        return "Chloe";
      default:
        return 'Versailles';
    }
  }
}
