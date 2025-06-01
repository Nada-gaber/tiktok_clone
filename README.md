# TikTok Clone

A TikTok-inspired video-sharing app




https://github.com/user-attachments/assets/78d0732d-d60c-46fe-827f-a59e5e0ce234


---

## 📖 Overview

A TikTok Clone built with **Flutter**, using the **Pixabay API** for video reels, **Firebase** for authentication and storage, **MVVM architecture**, and **Bloc/Cubit** for state management.

---

## ✨ Features

- 🎞️ **Reels**: Scroll through videos fetched from Pixabay API.  
- 🔍 **Search**: Find videos by keywords.  
- 🔐 **Authentication**: Login/register via Firebase Authentication.  
- 👤 **Profile**: Edit name and profile image, stored in Firebase Storage.  

---

## 🛠️ Tech Stack

- **Framework**: Flutter  
- **Architecture**: MVVM  
- **State Management**: Bloc/Cubit  
- **Backend**: Firebase Authentication, Firebase Storage, Pixabay API  
- **Libraries**: Dio, CachedNetworkImage, FlutterVideoPlayer  

---

## 🔑 Pixabay API Setup

1. Get an API key from [Pixabay](https://pixabay.com/api/docs/).
2. Store it in a `.env` file:

```env
PIXABAY_API_KEY=your_api_key_here 
```

## 🔑 Load the key using `flutter_dotenv`

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = dotenv.env['PIXABAY_API_KEY']!;

```
# Firebase Setup

## Authentication
Email/password login via Firebase.

## Storage
Store profile images/details.

```dart
final storageRef = FirebaseStorage.instance.ref().child('user_profiles/$userId/profile.jpg');
await storageRef.putFile(File(imagePath));
```

---

## 🚀 Getting Started

### Clone the Repo:
```bash
git clone https://github.com/Nada-gaber/tiktok_clone.git
cd tiktok_clone
```

### Install Dependencies:
```bash
flutter pub get
```

### Add Environment Variables:
Create a `.env` file with your Pixabay API key.

### Set Up Firebase:
- Add `google-services.json` (Android) or `GoogleService-Info.plist` (iOS).
- Enable Authentication and Storage in Firebase Console.

### Run the App:
```bash
flutter run
```
---

Built by **Nada Gaber**


