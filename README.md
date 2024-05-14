# uicCcredit

A financial app that allows people to get loans easily.

## Getting Started

Platfroms
- Android
- iOS

## Project Setup
```
git clone -b main https://github.com/cotetech-client-projects/quic-credit-mobile-app.git \quic_credit
```

Navigate to the project directory.
```
    cd quic_credit
```

Run the project
```
flutter pub get
```

```
flutter run
```

Build for ios
```
    flutter build ios
 ```

 Build for android
 ```
 flutter build android
 ```
 To clean the project

 ```
 flutter clean
 ```
# Flutter project structure

project_name/
|-- android/
|-- ios/
|-- lib/
|   |-- main.dart
|   |-- screens/
|   |   |-- splash_screen.dart
|   |   |-- onboarding_screen.dart
|   |   |-- signup_page.dart
|   |   |-- login_page.dart
|   |   |-- verification_page.dart
|   |   |-- password_reset.dart
|   |   |-- home_page.dart
|   |   |-- loan_activity.dart
|   |   |-- user_profile.dart
|   |   |-- loan_offers.dart
|   |-- models/
|   |-- services/
|   |-- utils/
|   |-- widgets/
|-- test/
|-- pubspec.yaml
|-- README.md
