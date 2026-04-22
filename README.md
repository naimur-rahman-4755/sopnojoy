📌 SopnoJoy – Dream. Inspire. Achieve.

SopnoJoy is a modern, responsive Flutter Web application designed to showcase inspiration, creativity, and user engagement through a clean UI and scalable architecture. It includes a fully functional Admin Dashboard for managing content dynamically using Supabase.

🚀 Project Overview

SopnoJoy is built with a strong focus on:

⚡ Performance (Flutter Web)
🧩 Scalable architecture (Feature-first structure)
🎯 Clean UI/UX (Minimal, responsive design)
🔄 Real-time data handling (Supabase backend)

The platform allows users to explore curated content while admins can efficiently manage everything through a dedicated admin panel.

🏗️ Architecture

This project follows a Feature-First Architecture, ensuring scalability and maintainability.

sopnojoy/
├── android/                # Android native config
├── assets/                 # Fonts, icons, images
│   ├── fonts/
│   ├── icons/
│   └── images/
├── lib/                    # Main Flutter source code
│   ├── main.dart
│   ├── app/                # App config, routes, theme
│   ├── core/               # Constants, services, providers, shared widgets
│   └── features/           # Feature-based modules (admin & public)
│       ├── admin/
│       └── public/
├── test/                   # Flutter tests
├── web/                    # Web build support files
├── pubspec.yaml            # Dependencies & assets config
└── README.md               # Project documentation

Why Feature-First?
Easy to scale for large projects
Better separation of concerns
Cleaner code organization
Faster development workflow
⚙️ Tech Stack
Frontend
Flutter Web
Responsive Layout System
Custom Design System (Spacing, Colors, Typography)
State Management
Riverpod (for reactive and scalable state handling)
Backend
Supabase
Database
Storage (images/files)
API handling
🔑 Key Features
🌐 User Side
Responsive modern UI
Dynamic content loading
Gallery system
Smooth scrolling experience
Clean minimal design
🛠️ Admin Panel

A powerful admin dashboard built inside the same project.

Features:
📊 Dashboard overview
🖼️ Gallery management
Add images
Delete images
Dynamic updates
📬 Message management (if implemented)
⚡ Real-time data updates
🔄 Auto refresh after actions
UI Highlights:
Card-based layout
Responsive grid system
No fixed heights (fully flexible UI)
Clean admin workflow
🧠 State Management (Riverpod)
Scalable and testable
Handles:
API state
Loading states
Error states
UI updates
☁️ Backend Integration (Supabase)

Used for:

Storing application data
Fetching dynamic content
Image storage
Real-time updates

📁 Project Structure Highlights
Modular design
Reusable widgets
Clean separation between UI and logic
Easily extendable features
📌 Design Principles
Minimal UI
Consistent spacing system
Responsive across screen sizes
Clean typography
No unnecessary complexity
🔮 Future Improvements
Authentication system
Role-based admin access
Analytics dashboard
API optimization
Mobile version

🙌 Author

Md Naimur Rahman
