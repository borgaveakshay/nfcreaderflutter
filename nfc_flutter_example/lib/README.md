# NFC Card Reader

A Flutter app to read payment card details via NFC.

## Features

- Read NFC-enabled payment cards
- Display card details including card number, expiry date, cardholder name, and card type

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio or Xcode for iOS development

### Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/nfc_card_reader.git
    cd nfc_card_reader/nfc_flutter_example
    ```

2. Install dependencies:
    ```sh
    flutter pub get
    ```

3. Run the app:
    ```sh
    flutter run
    ```

## Project Structure

- [main.dart](http://_vscodecontentref_/0): Entry point of the application.
- [home_screen.dart](http://_vscodecontentref_/1): Home screen of the application.
- [nfc_service.dart](http://_vscodecontentref_/2): Service to handle NFC card reading.
- [card_data.dart](http://_vscodecontentref_/3): Model for card data.
- [emv_parser.dart](http://_vscodecontentref_/4): Utility to parse EMV data from NFC tags.
- [card_details_widget.dart](http://_vscodecontentref_/5): Widget to display card details.

## App Architecture

The app follows a simple layered architecture:

1. **Presentation Layer**: Contains the UI code.
    - [main.dart](http://_vscodecontentref_/6): Entry point of the application.
    - `home_screen.dart`: Home screen of the application.
    - `card_details_widget.dart`: Widget to display card details.

2. **Service Layer**: Contains the business logic and services.
    - `nfc_service.dart`: Service to handle NFC card reading.

3. **Data Layer**: Contains the data models and utilities.
    - `card_data.dart`: Model for card data.
    - `emv_parser.dart`: Utility to parse EMV data from NFC tags.

## Permissions

### Android

Ensure the following permissions are added in [AndroidManifest.xml](http://_vscodecontentref_/7):
```xml
<uses-permission android:name="android.permission.NFC" />
<uses-feature android:name="android.hardware.nfc" android:required="true" />