# Figma Cafe 2024 [Unfinished Restaurant Mobile App]
This project is an unfinished restaurant mobile app developed using the Flutter framework in 2024. Despite my role as the team leader and efforts to support the team, it is still incomplete because the challenge with slow teamwork even helping and scolding them will not go well. Most of the progress was achieved by me, with some assistance from ChatGPT. Notable features include a working food ordering cart and good UI for pages like Food Details, Payment, and Add Balance.

<b>Table of Contents</b>

- Introduction
- Features
- Technologies Used
- Installation
- Pubspec Requirements
- Usage
- Pages
- Contributing
- Contact

<b>Introduction</b>

This restaurant mobile app project was intended to provide a comprehensive solution for food ordering and management. Despite being unfinished, it showcases several functional and well-designed pages. The main challenges were related to teamwork, which led to the project's incomplete status.

<b>Features</b>

- Functional food ordering system
- User and admin interfaces
- Payment integration with various methods
- Detailed UI for multiple pages

<b>Technologies Used<b>

- Flutter
- Dart

<b>Installation</b>

To run this project locally, follow these steps:

1. Install Flutter
2. Flutter Doctor (Should be all fully checklisted)
3. Download Visual Studio Code
4. Install Flutter Extension
5. Run the code

<b>Pubspec Requirements</b>

dependencies:
- autocomplete_textfield: ^2.0.1
- carousel_slider: ^4.2.1
- cloud_firestore: ^4.13.0
- cupertino_icons: ^1.0.2
- dio: ^5.3.3
- firebase_auth: ^4.13.0
- firebase_core: ^2.22.0
- flutter:
-   sdk: flutter
- image_picker: ^1.0.7
- intl: ^0.18.1
- mime: ^1.0.4
- provider: ^6.1.1
- rename: ^3.0.1
- shared_preferences: ^2.2.2
- slide_countdown: ^1.5.0
- video_player: ^2.8.2

fonts:
    - family: Poppinsx
      fonts:
        - asset: lib/fonts/Poppins-Bold.ttf

<b>Usage</b>

Explore the app to see the implemented features and UI designs. Note that some features are incomplete or may not function as intended.

<b>Pages</b>

1. User
- Login: User authentication.
- Homepage: Main food list page for users.
- Food Details: Detailed view of food items.
- Profile:
-- Edit Account
2. Address
3. Change Address
- Payment:
1. Choose Type Payment (Indomaret, Alfamaret, Seabank, OVO)
2. Add Balance Details
3. Confirm Balance Payment
4. Authenticate (Provide Authentication Code to chosen payment method, with a waiting period of 24 hours)
- Cart Order: Manage food orders in the cart.
- Reservation Order: Place reservations.
- Success Order: Order confirmation (Wait 5 minutes for acceptance by Cashier).
- Notification: View notifications.
2. Admin
- Auth Workspace: Authenticate to enter Figma Workspace for Admin and Cashier.
- Choose Role: Select role (Admin/Cashier).
- Login Admin: Login using Email, Password, and Restaurant Code.
- Dashboard:
1. Customer Data
2. Cashier Data
3. Add Cashier Data
4. Chat from Cashier Contact
3. Cashier
- Auth Workspace: Authenticate to enter Figma Workspace for Admin and Cashier.
- Choose Role: Select role (Admin/Cashier).
- Login Cashier: Login using Email, Password, and Restaurant Code.
- Dashboard:
1. Customer Order
2. F&B Manager
3. Admin Contact (Support for Cashier issues)

<b>Contributing</b>
Contributions are welcome! If you have any suggestions or improvements, please create a pull request or open an issue.

<b>Contact</b>
If you have any questions or want to get in touch, you can reach me at widyagunawan3@gmail.com.
