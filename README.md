# AIOps Command

A production-grade, dark-mode-first AIOps dashboard built with Flutter. **AIOps Command** is designed to provide real-time monitoring statistics, routing lane health, activity logs, and AI-driven insights for complex infrastructure deployments. 

![AIOps Command Theme](https://img.shields.io/badge/Theme-Strict%20Dark%20Mode-0d1b3e)
![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![State Management](https://img.shields.io/badge/State-Riverpod-blue)
![License](https://img.shields.io/badge/License-MIT-green)

---

## ✨ Features

### 1. Onboarding & Authentication
* **Custom Illustrations:** 100% code-driven onboarding illustrations using CSS-like Flutter shapes (no external image assets).
* **Firebase Auth Integration:** Secure Email & Password Login, Sign-up, and Password Reset workflows.
* **Form Validation:** Client-side validation integrated seamlessly with dark-mode `AuthTextField`s and `AuthErrorBanner`s.

### 2. AIOps Dashboard
* **Dynamic Date Filtering:** Built-in `DateRangeSelector` to filter metrics globally.
* **KPI Metrics:** Live statistics tracking requests, latency, token usage, and cost with visual trend indicators.
* **System Health:** Monitored microservices (Gateway, Vector DB, Workers, AI Models) mapped to visual health statuses.
* **Geographic Routing Lanes:** View active region routing capacities (e.g., US-East, APJ, EU-West) with progressive capacity bars.
* **Request Volume:** Code-driven bar charts demonstrating infrastructure throughput without relying on heavy chart libraries.
* **Recent Activity Feed:** Quick overview of the latest events directly on the home screen.

### 3. Activity Logs
* **Granular Feed:** Dedicated stream for system logs categorizing events by `INFO`, `WARN`, and `ERROR`.
* **Dynamic Filtering:** Horizontal chip selector to filter logs by severity or service module.

### 4. AI Insights
* **Automated Auditing:** Mock AI reporting mechanism that grades the infrastructure.
* **Actionable Recommendations:** Automatically highlights suboptimal configurations (e.g., unused worker node capacity, high vector DB latency) and suggests exact actionable remediations.

### 5. Settings Workspace
* **User Preferences:** Modular list configuration for API Key management, notification settings, and Dark Mode enforcement.
* **Firebase Sign Out:** Clean, secure logout workflow.

---

## 🎨 Design System

This app strictly adheres to an **industrial-SaaS dark mode aesthetic**:
* **No `BoxShadow`s:** Visual hierarchy is enforced strictly using borders (`AppColors.outline`) and subtle variations in surface tones (`AppColors.surfaceContainer`, `AppColors.surfaceBright`).
* **Monospace Typography:** Uses `Source Code Pro` (`monoKey`) for timestamps, log metadata, and terminal-like elements.
* **Deep Contrast Backgrounds:** True black (`#050505`) and deep gray surfaces map to premium professional tool aesthetics.

---

## 🏗️ Architecture

* **Routing:** `go_router` combined with `StatefulShellRoute` handles nested bottom navigation, keeping the app's structural shell intact while users move between phases.
* **State Management:** Fully reactive architecture driven by `flutter_riverpod` and `riverpod_generator` (v3). Providers are generated via build_runner for strict compile-time safety.
* **Repository Pattern:** Logic is decoupled using interface wrappers (`IDashboardRepository`, `IActivityRepository`) and mock data classes. *Ready to be hot-swapped for actual REST APIs or Firebase Firestore instances.*

---

## 🚀 Getting Started

### Prerequisites
* Flutter SDK (3.x)
* Firebase CLI (`npm install -g firebase-tools`)
* FlutterFire CLI (`dart pub global activate flutterfire_cli`)

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run Code Generation (Riverpod)
If you modify any Providers or Models, run the build runner to regenerate `.g.dart` files:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Configure Firebase
Because the app uses `FirebaseAuth`, you must link your Firebase project before logging in:
```bash
flutterfire configure
```
*(This command will prompt you to select your Firebase project and will generate `lib/firebase_options.dart`)*

### 4. Run the App
```bash
flutter run
```

---

## 📁 Project Structure

```text
lib/
├── core/
│   ├── router/          # go_router configurations and routes
│   └── theme/           # strict dark mode colors, fonts, and theme data
├── data/
│   └── repositories/    # Interface and Mock implementations for API data
├── features/
│   ├── activity/        # Log viewer, log models, and log providers
│   ├── auth/            # Login, Signup, Auth models, and FirebaseAuth providers
│   ├── dashboard/       # Main KPIs, charts, routing lanes, and widgets
│   ├── insights/        # AI-driven action cards
│   ├── onboarding/      # Welcome flow and code-based illustrations
│   └── settings/        # Account and App preferences
├── shared/
│   └── widgets/         # Reusable structural components (AppCard, PillBadge, etc.)
└── main.dart            # App entry point
```

---

## 📜 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.