# Notes Management App (Flutter + Cloud Firestore)

A simple CRUD notes app. Each note has a **title** and **description**, stored
in a Cloud Firestore collection called `notes`.

## Features
- **Create** — Add a new note (title + description)
- **Read** — View all notes in a real-time list (`StreamBuilder`)
- **Update** — Edit an existing note
- **Delete** — Remove a note (with confirmation dialog)

## Project Structure
```
lib/
  main.dart                     # App entry point, Firebase init
  models/
    note.dart                   # Note data model
  services/
    note_service.dart           # Firestore CRUD logic
  screens/
    notes_list_screen.dart      # Displays all notes
    add_edit_note_screen.dart   # Add/Edit form
```

## Setup Instructions

### 1. Create the Flutter project locally
If you haven't already, create a fresh project and copy these files in:
```
flutter create notes_app
```
Then replace the generated `pubspec.yaml` and `lib/` folder with the files
from this submission.

### 2. Install dependencies
```
flutter pub get
```

### 3. Connect Firebase (this generates `firebase_options.dart`)
This project intentionally does **not** include `lib/firebase_options.dart`
because it's tied to your personal Firebase project. Generate it yourself:

1. Install the Firebase CLI (if you don't have it):
   ```
   npm install -g firebase-tools
   ```
2. Install the FlutterFire CLI:
   ```
   dart pub global activate flutterfire_cli
   ```
3. Log in to Firebase:
   ```
   firebase login
   ```
4. Go to the [Firebase Console](https://console.firebase.google.com),
   create a new project (e.g. `notes-app`), and enable **Cloud Firestore**
   (Build → Firestore Database → Create database → Start in test mode).
5. From your project root, run:
   ```
   flutterfire configure
   ```
   Select your Firebase project and the platforms you want (Android/iOS/Web).
   This automatically creates `lib/firebase_options.dart` and the
   platform config files (`google-services.json`, etc.).

### 4. Run the app
```
flutter run
```

## Firestore Data Model
Collection: `notes`
```
notes/{noteId}
  title: string
  description: string
  createdAt: timestamp
```

## Submission Checklist
- [ ] Push this project to a **public** GitHub repository
- [ ] Confirm `firebase_options.dart` is either included (if using a shared/
      test Firebase project) or excluded with setup instructions (recommended,
      since it contains project-specific API keys)
- [ ] Add a `.gitignore` that excludes `build/`, `.dart_tool/`, and other
      generated Flutter files
- [ ] Submit the GitHub repo link

## Pushing to GitHub
```
git init
git add .
git commit -m "Notes Management App with Firestore CRUD"
git branch -M main
git remote add origin https://github.com/<your-username>/notes_app.git
git push -u origin main
```
Then make sure the repo's visibility is set to **Public** in GitHub settings.
