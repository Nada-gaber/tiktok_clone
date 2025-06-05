# TikTok Clone
![1](https://github.com/user-attachments/assets/eda859db-9421-4113-8079-29913601834f)

---

## 🛠️ Tech Stack

- **Framework**: Flutter  
- **Architecture**: MVVM  
- **State Management**: Bloc/Cubit  
- **Backend**: Firebase Authentication, Firebase Storage, Pixabay API, Hive local storage
- **Libraries**: Dio, CachedNetworkImage, FlutterVideoPlayer, Hive 

---
## 👨‍💻  Features

![1](https://github.com/user-attachments/assets/a2b55883-2734-4f9b-b666-bd45abe4c470)
![2](https://github.com/user-attachments/assets/200526ff-534a-4cde-b378-244b00a04d22)
![3](https://github.com/user-attachments/assets/9549be5e-eff4-4061-b8ab-45649ddaf211)
![4](https://github.com/user-attachments/assets/f7005720-f4c6-4732-abd3-782b0d203c28)

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

---

Built by **Nada Rizk**


