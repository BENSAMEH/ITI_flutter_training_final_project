# 🛍️ ShopEase — Flutter E-Commerce App
A full-featured mobile e-commerce application built with Flutter as the final project for the **ITI (Information Technology Institute) Flutter Training Program**.

---

## 📱 Screenshots

<p align="center">
  <img src="https://github.com/BENSAMEH/ITI_flutter_training_final_project/blob/main/ScreenShots/Screenshot_20250820_143225.png?raw=true" width="200"/>
  <img src="https://github.com/BENSAMEH/ITI_flutter_training_final_project/blob/main/ScreenShots/Screenshot_20250820_143333.png?raw=true" width="200"/>
  <img src="https://github.com/BENSAMEH/ITI_flutter_training_final_project/blob/main/ScreenShots/Screenshot_20250820_143349.png?raw=true" width="200"/>
  <img src="https://github.com/BENSAMEH/ITI_flutter_training_final_project/blob/main/ScreenShots/Screenshot_20250820_143419.png?raw=true" width="200"/>
</p>

---

## ✨ Features

- 🔐 **Authentication** — Sign up and log in securely with Firebase Auth
- 🛒 **Shopping Cart** — Add, remove, and manage products in your cart
- 🗂️ **Product Browsing** — Browse products with a clean GridView layout
- 📦 **Product Details** — View full product information before purchasing
- 🎨 **Modern UI** — Responsive design with smooth animations using Material Design
- 🌐 **REST API Integration** — Fetch real-time product data via Dio
- 💾 **Cloud Firestore** — User data and cart synced to the cloud in real time

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | Bloc / Cubit (flutter_bloc) |
| Authentication | Firebase Auth |
| Database | Cloud Firestore |
| HTTP Client | Dio |
| UI | Google Fonts, Animated Text Kit, Flutter Spinkit |
| Navigation | Animated Bottom Navigation Bar |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.8.1`
- Dart SDK
- A Firebase project with **Authentication** and **Firestore** enabled

### Installation

1. **Clone the repository**
```bash
   git clone https://github.com/BENSAMEH/ITI_flutter_training_final_project.git
   cd ITI_flutter_training_final_project
```

2. **Install dependencies**
```bash
   flutter pub get
```

3. **Configure Firebase**
   - Create a project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Email/Password Authentication
   - Enable Cloud Firestore
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate platform folders

4. **Run the app**
```bash
   flutter run
```

---

## 📁 Project Structure
lib/
├── main.dart               # App entry point
├── models/                 # Data models
├── cubits/                 # Bloc/Cubit state management
├── screens/                # UI screens
│   ├── auth/               # Login & Registration screens
│   ├── home/               # Product listing
│   ├── product/            # Product details
│   └── cart/               # Cart & checkout
├── widgets/                # Reusable UI components
└── services/               # API & Firebase services

---

## 🧰 Dependencies

```yaml
firebase_core: ^4.0.0
firebase_auth: ^6.0.0
cloud_firestore: ^6.0.0
flutter_bloc: 9.1.1
dio: ^5.8.0+1
google_fonts: ^6.3.0
animated_text_kit: ^4.2.2
animated_bottom_navigation_bar: ^1.4.0
flutter_spinkit: ^5.2.2
url_launcher: ^6.2.6
```

---

## 👨‍💻 Author

**Ahmed Sameh**
- 📧 ahmedsameh77sa@gmail.com
- 💼 [LinkedIn](https://www.linkedin.com/in/ahmed-sameh-602907296)
- 🐙 [GitHub](https://github.com/BENSAMEH)

---

## 📄 License

This project was built as a training final project for the ITI Flutter program. Feel free to explore and learn from it.