# food_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.


-----------------------
to run main_dev.dart
flutter run -t lib/main_dev.dart  
-----------------------
to run main_prod.dart
flutter run -t lib/main_prod.dart  
-----------------------
to gen APK
flutter build apk -t lib/main_dev.dart
-----------------------
translation gen
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
-----------------------
gen .g files
flutter packages pub run build_runner build

