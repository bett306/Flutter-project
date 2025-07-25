# 📱 Youth Opportunity Hub App

The **Youth Opportunity Hub** is a Flutter mobile application built to connect Kenyan youth with verified opportunities such as scholarships, internships, training programs, and jobs. This MVP (Minimum Viable Product) version works with locally stored mock data and search features to improve accessibility to life-changing resources.

---

## Features

-  Welcome screen with hero image and navigation
-  Login screen with user input fields
-  List of verified youth opportunities
-  Search and category-based filtering (Scholarships, Internships, Training, Jobs)
-  Deadline information
- 🔗 Click to apply (launches browser)
-  Mock data loaded from local JSON file
- 💚 Clean and responsive UI built with Dart and Flutter

---

## 📁 Folder Structure

```plaintext
lib/
├── data/                    # Local mock JSON data
├── models/                 # Data models (e.g., Opportunity)
├── screens/                # UI pages (Welcome, Login, Home, Details)
├── services/               # Data loading (LocalDataService)
├── utils/                  # Constants and helpers
├── widgets/                # Reusable UI components
└── main.dart               # Entry point

```
### Getting Started
 Clone the repository
```bash
git clone https://github.com/bett306/Flutter-project.git
cd youth-opportunity-hub

```
 Install dependencies
 ```bash
flutter pub get
```
⚙️ Enable Developer Mode (Windows only)
If you're using Windows, you must enable Developer Mode for plugin support:
```bash
start ms-settings:developers
```
🧹 Clean build & run the app
```bash
flutter clean
flutter pub get
flutter run
```

| Feature                        | Status     |
| ------------------------------ | ---------- |
| Welcome + Login UI             | ✅ Done     |
| List of Opportunities          | ✅ Done     |
| Search + Filter by Category    | ✅ Done     |
| View details + apply link      | ✅ Done     |
| Bookmark/save feature          | 🔜 Planned |
| Firebase integration (backend) | 🔜 Planned |
| Admin panel for submissions    | ⏳ Future   |




