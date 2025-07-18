# 🧭 Survival App

A Flutter-based mobile application designed to help you **stay prepared** during emergencies, natural disasters, and survival situations. Whether you're facing a blackout, storm, or just prepping your go-bag! this app has you covered.

---

## 🚀 Features

- ✅ **Emergency checklists** – Customisable lists for food, first aid, comms, and shelter
- 🌐 **Offline survival guides** – No internet? No problem.
- 🎒 **Gear inventory tracker** – Manage and log your bug-out bag or home supplies
- 🔔 **Rapid alert mode** – Flashlight strobe + loud alerts when needed
- 📱 Designed for **mobile-first** (Android/iOS), web port optional in future

---

## 🧪 Tech Stack

| Layer         | Tool         |
|--------------|--------------|
| UI           | Flutter (Material Design) |
| Platform     | Android (iOS/web later) |
| State Mgmt   | TBD (Provider / Riverpod / Bloc) |
| Offline Data | TBD (Hive / SharedPrefs / SQLite) |

---

## 🛠️ Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/tom-robinsonuk/survival_app.git
   cd survival_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run on emulator or device:
   ```bash
   flutter run
   ```

---

## 📂 Folder Structure (Minimalist)

```
lib/
 ├── main.dart
 ├── screens/
 ├── widgets/
test/
android/  ← native wrapper
ios/      ← native wrapper
```

---

## 🤖 Platform Notes

- Android fully supported (tested on emulator + device)
- iOS not yet tested — future support planned
- Web port is temporarily removed to reduce bloat, will return when needed

---

## ❤️ Author

Made with 💻 + ☕ by TDRobinsonUK  