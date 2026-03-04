
# Countries App - A2SV Technical Assessment 2025

A beautiful, performant, and fully-featured mobile application that lets users explore countries worldwide using the REST Countries API.

Built with clean architecture, modern Flutter practices, and all required features + **maximum bonus points**.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Features

- **Two-step API fetching** (minimal data for lists, full data for details)
- Real-time search with **debouncing**
- **Continent filtering** using FilterChips
- Sorting by Name or Population
- **Pull-to-Refresh** on home screen
- **Hero animations** on flag transition
- Favorites system with local persistence
- Offline support via caching
- Clean loading, error, and empty states
- Fully responsive UI

## 🎯 Bonuses Implemented

- **Hero Animation** – Smooth flag transition from list to detail screen
- **Dark Mode** – System theme + manual toggle with persistence
- **Pull-to-Refresh**
- **Search Debouncing**
- **Data Caching** (Hive + JSON)
- **Dependency Injection** (GetIt)
- **Code Generation** (Freezed + json_serializable)
- **Sorting** by name/population
- **Continent Filter** (extra bonus feature)
- Shimmer loading states
- Modern Material 3 design

## 🛠 Tech Stack & Architecture

- **State Management**: Bloc/Cubit (preferred by A2SV)
- **API Client**: Dio
- **Local Storage & Caching**: Hive
- **Models**: Freezed (immutable + code generation)
- **Dependency Injection**: GetIt
- **UI**: Material 3 + CustomScrollView + SearchBar
- **Architecture**: Clean, scalable, well-documented

## 🚀 How to Run Locally

### Prerequisites
- Flutter SDK (3.19+)
- Dart 3.3+

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/bekidink/country-list-flutter.git
cd countries-app

# 2. Install dependencies
flutter pub get

# 3. Generate code (Freezed models)
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

**Build APK for submission:**
```bash
flutter build apk --release
```

APK location: `build/app/outputs/flutter-apk/app-release.apk`


## 🧠 Architecture Decisions

- **Bloc/Cubit** chosen for its predictability and excellent testing support (A2SV preference).
- **Hive + JSON serialization** for caching (avoided complex Hive adapters for reliability).
- **Two-step API strategy** strictly followed for performance.
- **Client-side filtering** for search + continent (fast and offline-friendly).
- **GetIt** for clean dependency injection.

## 📋 Requirements Status

- All **User Stories** fully implemented
- All **Technical Requirements** satisfied
- **Most Bonus Challenges** completed

