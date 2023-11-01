# TapadaCommunity - Empowering Expats with Social Services

TapadaCommunity is an open-source mobile application developed by [ACITMMM](https://acitmmm.webnode.pt) (Associação a comunidade Islâmica Mercês e Mem martins) to assist expatriates in finding essential social services within the Tapada Das Mercês neighborhood. The application is built using Flutter and is designed for both iOS and Android platforms.

FIGMA [Prototype](https://www.figma.com/proto/4V4WZcLGmBjYyqKwImtfau/ACCITMMM?node-id=61-23&starting-point-node-id=1%3A2&mode=design&t=rfwTWkxFo4JGM9uG-1)
 
<div style="display: flex;">
   <img src="/screenshots/screenshot.png" alt="App Screenshots" width="224" height="426" style="flex: 1; margin-right: 10px;" >
   <img src="/screenshots/screenshot1.jpeg" alt="App Screenshots" width="270" height="585" style="flex: 1; margin-right: 10px;">
   <img src="/screenshots/screenshot2.jpeg" alt="App Screenshots" width="320" height="780" style="flex: 1; margin-right: 10px;">
</div>

## Features

- Browse a comprehensive directory of social services available in Tapada Das Mercês.
- Get detailed information about each service, including contact information, operating hours, and location.
- Search for services based on categories, keywords, or specific needs.
- Mark favorite services for quick access.
- User-friendly interface and smooth navigation.

## Contributing

We welcome contributions from the community! If you'd like to contribute to TapadaCommunity please clone the respository and open issues and merge requests.

## License

This project is licensed under the MIT License.

## Contact

For inquiries about the project or organization, you can reach out to ACITMMM at contact@acitmmm.org.

## Getting Started

These instructions will guide you through setting up the development environment and running the app on your local machine.

### Prerequisites

- Flutter SDK: Follow the official guide to [install Flutter](https://flutter.dev/docs/get-started/install).
- Git: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) if not already installed.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/ACITMMM/TapadaCommunity.git
   ```

2. Change into the project directory:
   ```bash
   cd TapadaCommunity
   ```
   
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Create the debug key.

```keytool -genkey -v -keystore ~/.android/debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000
What is your first and last name?
  [Unknown]:  Tapada
What is the name of your organizational unit?
  [Unknown]:  Community
What is the name of your organization?
  [Unknown]:  TDM
What is the name of your City or Locality?
  [Unknown]:  Cintra
What is the name of your State or Province?
  [Unknown]:  LX
What is the two-letter country code for this unit?
  [Unknown]:  PT
Is CN=Tapada, OU=Community, O=TDM, L=Cintra, ST=LX, C=PT correct?
  [no]:  yes

Generating 2,048 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 10,000 days
	for: CN=Tapada, OU=Community, O=TDM, L=Cintra, ST=LX, C=PT```
   
5. List the SHA-1 and SHA-256 fingerprints for your `debug.keystore`, which usually lies on an `.android` folder inside your home folder.

   5a. For Linux and Mac:

   ```bash
   keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
   ```

   5b. For Windows:

   ```bash
   keytool -list -v -keystore C:\Users\<your-username>\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android
   ```
   
   The output should contain the following snippet (with different fingerprint values):

   ```
   ...
   Certificate fingerprints:
      SHA1: 37:E8:22:2F:B0:E6:7C:F5:D3:EB:FB:B1:DE:1F:17:E4:1C:E5:03:65
      SHA256: 67:C8:79:A6:50:C8:F9:3E:5E:C7:12:00:D3:6A:E4:B1:50:0D:63:64:84:EB:6D:A1:F6:1C:97:E6:30:AE:F0:97
   ...
   ```


6. Add SHA certificate fingerprints to the [Android App on Firebase project](https://console.firebase.google.com/u/0/project/tapadacommunity/settings/general/android:org.acitmmm.tapadacommunity).
   
   **IMPORTANT**: Add both SHA-1 and SHA-256.
      

7. Run the app:

   ```bash
   flutter run
   ```

   4a. if you have more than one device connected you might choose one:
   
      ```
      Connected devices:
      SM A405FN (mobile) • R18D35BH69H                              • android-arm64  • Android 11 (API 30)
      2201116PG (mobile) • de83fac63626                             • android-arm64  • Android 13 (API 33)
      iPhone B0 (mobile) • a11d42cd5a2a3080927a0f3daac4fd8d18c3ccf6 • ios            • iOS 15.7.8 19H364
      Chrome (web)       • chrome                                   • web-javascript • Google Chrome 116.0.5845.96
      
      No wireless devices were found.
      
      [1]: SM A405FN (R58N35B76CH)
      [2]: 2201116PG (defac8366236)
      [3]: iPhone b0 (a11d0927a0f42cd5a2a3083daac4fd8d18c3ccf6)
      [4]: Chrome (chrome)
      ```

8. After choose anh device flutter will compile the code for the platform and a menu like that might appear:

   ```bash
   Launching lib/main.dart on SM A405FN in debug mode...
   Running Gradle task 'assembleDebug'...                                146.9s
   ✓  Built build/app/outputs/flutter-apk/app-debug.apk.
   Installing build/app/outputs/flutter-apk/app-debug.apk...              18.4s
   Syncing files to device SM A405FN...                                    4.2s
   
   Flutter run key commands.
   r Hot reload. 🔥🔥🔥
   R Hot restart.
   h List all available interactive commands.
   d Detach (terminate "flutter run" but leave application running).
   c Clear the screen
   q Quit (terminate the application on the device).
   ```

