# TikTok Clone
![readme](https://github.com/user-attachments/assets/753b600e-5c9c-4042-9bcf-08ee3e2a71a5)

---

## 🛠️ Tech Stack

- **Framework**: Flutter  
- **Architecture**: MVVM  
- **State Management**: Bloc/Cubit  
- **Backend**: Firebase Authentication, Firebase Storage, Pixabay API, Hive local storage
- **Libraries**: Dio, CachedNetworkImage, FlutterVideoPlayer, Hive 

---
## 👨‍💻  Features

![2](https://github.com/user-attachments/assets/1943ec7a-501e-41d7-a9fa-bff0e3a44f69)
![1](https://github.com/user-attachments/assets/1230b245-4a07-4b1d-93c3-693125400616)
![3](https://github.com/user-attachments/assets/0cdfde03-89df-458a-9f80-a4438014abdf)
![4](https://github.com/user-attachments/assets/8ea4abd1-269f-4780-968f-8e72ed9e1f54)

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

## 🏗️ Firebase Setup
#### Authentication
Email/password login via Firebase.

## Storage
Store profile images/details.

```dart
final storageRef = FirebaseStorage.instance.ref().child('user_profiles/$userId/profile.jpg');
await storageRef.putFile(File(imagePath));
```


