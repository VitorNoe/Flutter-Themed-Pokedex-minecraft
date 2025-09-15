# Minecraft Manager App

## Overview

This is a Flutter application designed to manage and display information about various Minecraft items. It provides a pixel-themed user interface, animations, and detailed views for each item, leveraging an external Minecraft API to fetch data.

The application is built with Flutter, allowing it to be deployed across multiple platforms including Android (APK), Web, and Windows from a single codebase.

## Features

*   **Pixel-Themed UI:** A custom theme inspired by Minecraft's pixelated aesthetic, featuring green and gray color schemes.
*   **Item Listing:** Displays a grid of Minecraft items fetched from an external API.
*   **Item Details:** Provides a detailed view for each item, including its name, namespaced ID, description, stack size, and renewability.
*   **Animations:** Includes fade-in animations for item cards and Hero animations for smooth image transitions between screens.
*   **Image Proxy:** Utilizes a Node.js-based proxy server to handle image loading from external URLs, mitigating potential CORS issues.
*   **Cross-Platform:** Supports deployment as an Android APK, a web application, and a native Windows application.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have the following installed:

*   **Flutter SDK:** [Install Flutter](https://flutter.dev/docs/get-started/install)
*   **Node.js and npm:** [Install Node.js](https://nodejs.org/en/download/)
*   **Git:** [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/VitorNoe/Flutter-Themed-Pokedex
    cd minecraft_manager
    ```

2.  **Set up Flutter dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Set up the Image Proxy Server:**
    The application relies on a simple Node.js proxy server to fetch images from the Minecraft API. This helps in bypassing potential CORS issues or other restrictions when loading images directly from external URLs.

    *   Navigate to the `proxy_server` directory:
        ```bash
        cd proxy_server
        ```
    *   Install Node.js dependencies:
        ```bash
        npm install
        ```
    *   Start the proxy server:
        ```bash
        node index.js
        ```
        The server will typically run on `http://localhost:3000`. Make sure this server is running whenever you run the Flutter app.

    *   **Update Flutter App's Proxy URL:**
        In the Flutter project, open `lib/image_proxy.dart` and update the `_proxyBaseUrl` to match your running proxy server's URL. If running locally, it should be:
        ```dart
        static const String _proxyBaseUrl = 'http://localhost:3000/proxy';
        ```
        (Note: The provided ZIP might have a temporary public URL. Change it to `http://localhost:3000/proxy` for local development).

4.  **Font Setup (Optional but Recommended for Pixel Theme):**
    The app's pixel theme uses a custom font (e.g., 'Minecraftia'). To apply this font:

    *   Create an `assets/fonts/` directory in the root of your Flutter project (if it doesn't exist).
    *   Download your desired pixel font (e.g., `Minecraftia.ttf`) and place it in `assets/fonts/`.
    *   Ensure your `pubspec.yaml` file has the `fonts` section configured correctly:
        ```yaml
        flutter:
          uses-material-design: true
          fonts:
            - family: Minecraftia
              fonts:
                - asset: assets/fonts/Minecraftia.ttf
        ```
    *   Run `flutter pub get` again after modifying `pubspec.yaml`.

### Running the Application

With the proxy server running and Flutter dependencies installed, you can run the application:

```bash
flutter run
```

To run on a specific platform (e.g., Chrome for web, Windows desktop):

```bash
flutter run -d chrome
flutter run -d windows
# For Android, ensure a device or emulator is connected
flutter run
```

## API Reference

This application utilizes the unofficial Minecraft API from the following GitHub repository:

*   **anish-shanbhag/minecraft-api:** [https://github.com/anish-shanbhag/minecraft-api](https://github.com/anish-shanbhag/minecraft-api)

The API provides endpoints for various Minecraft data, including items, blocks, and crafting recipes. The Flutter application specifically uses the `/api/items` endpoint to fetch item data.

## Building and Exporting

### Android (APK)

To generate a release APK for Android:

```bash
flutter build apk --release
```

The generated APK will be located at `build/app/outputs/flutter-apk/app-release.apk`.

### Web

To build the web application for deployment:

```bash
flutter build web --release
```

Static files for the web application will be generated in the `build/web` directory. These files can be hosted on any web server.

### Windows

To build the native Windows executable:

```bash
flutter build windows --release
```

The executable and associated files will be found in `build/windows/x64/release/`. Note that for Windows builds, you need to have the necessary desktop development tools (e.g., Visual Studio with C++ desktop development workload) installed on your system.

## Project Structure (Key Files)

*   `lib/main.dart`: Main entry point of the Flutter application.
*   `lib/image_proxy.dart`: Handles image URL proxying.
*   `lib/models/item.dart`: Data model for Minecraft items.
*   `lib/services/api_service.dart`: Service for API calls.
*   `lib/providers/item_provider.dart`: State management for items using Provider.
*   `lib/screens/home_screen.dart`: Displays the list of Minecraft items.
*   `lib/screens/item_detail_screen.dart`: Displays detailed information for a selected item.
*   `lib/theme/app_theme.dart`: Defines the application's pixelated theme.
*   `lib/widgets/animated_item_card.dart`: Custom widget for animated item cards.
*   `pubspec.yaml`: Project dependencies and asset declarations.
*   `proxy_server/index.js`: The Node.js proxy server script.

## License

This project is open-source and available under the [MIT License](LICENSE).