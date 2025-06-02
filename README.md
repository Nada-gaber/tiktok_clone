# TikTok Clone
![1](https://github.com/user-attachments/assets/eda859db-9421-4113-8079-29913601834f)

---

## 🛠️ Tech Stack

- **Framework**: Flutter  
- **Architecture**: MVVM  
- **State Management**: Bloc/Cubit  
- **Backend**: Firebase Authentication, Firebase Storage, Pixabay API  
- **Libraries**: Dio, CachedNetworkImage, FlutterVideoPlayer  

---
## 👨‍💻  Features

![2](https://github.com/user-attachments/assets/db952db8-5372-4047-9ed8-524dba2de268)
![3](https://github.com/user-attachments/assets/f2f4f12a-dd03-4482-b94b-828f63d9c7d7)
![4](https://github.com/user-attachments/assets/e9f3c6f7-db25-4890-b49e-ff1a2f5ed402)
![5](https://github.com/user-attachments/assets/35fe43a2-294f-4af2-b87a-f06b85dba4d7)

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
## Authentication
Email/password login via Firebase.

## Storage
Store profile images/details.

```dart
final storageRef = FirebaseStorage.instance.ref().child('user_profiles/$userId/profile.jpg');
await storageRef.putFile(File(imagePath));
```

---

Built by **Nada Rizk**


