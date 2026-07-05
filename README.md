# Notes Management App (Flutter + Cloud Firestore)

A simple CRUD notes app. Each note has a **title** and **description**, stored
in a Cloud Firestore collection called `notes`.

## Features
- **Create** — Add a new note (title + description)
- **Read** — View all notes in a real-time list (`StreamBuilder`)
- **Update** — Edit an existing note
- **Delete** — Remove a note (with confirmation dialog)

## Project Structure
lib/
main.dart                     # App entry point, Firebase init
models/
note.dart                   # Note data model
services/
note_service.dart           # Firestore CRUD logic
screens/
notes_list_screen.dart      # Displays all notes
add_edit_note_screen.dart   # Add/Edit form

## Setup Instructions

### 1. Install dependencies
flutter pub get

### 2. Connect Firebase
This project already includes Firebase configuration connected to a
Firestore database. If you want to connect it to your own Firebase project
instead, regenerate the config with:
dart pub global activate flutterfire_cli
firebase login
flutterfire configure

### 3. Run the app
flutter run

## Firestore Data Model
Collection: `notes`
notes/{noteId}
title: string
description: string
createdAt: timestamp

## Features Demonstrated
- Real-time Firestore sync using `StreamBuilder`
- Full CRUD (Create, Read, Update, Delete) operations
- Form validation on note title/description
- Delete confirmation dialog
