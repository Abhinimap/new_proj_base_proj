# Write your project name here

**ProjectName** description

This project serves as a basic Flutter template utilizing GetX for state management.

## Features

This starter template includes the following features:

1. **Makefile Integration**
    - A `Makefile` is provided to simplify the execution of various commands. If you're unfamiliar with Makefiles, consider looking up some online resources to understand how they work.

2. **SharedPreference Helper**
    - A `SharedPreference` helper class is included to manage shared preferences. Feel free to modify this class according to your specific requirements.

3. **Firebase Helper**
    - The project includes a Firebase helper class that initializes all Firebase-related services. Please make sure to configure Firebase in your project first.

4. **API Integration**
    - API calling is handled using the Dio client, complete with interceptors and loggers. *(Note: Implement response handling in a dedicated class as a TODO item.)*

5. **Asset and Color Management with flutter_gen**
    - We use `flutter_gen` for managing assets and colors, which generates files to make these easier to manage.

6. **Icon Management with flutter_icons**
    - The project includes the `flutter_icons` package. To use it, simply configure your icons in the `pubspec.yaml` file.

7. **JSON Serialization with json_serializable**
    - The `json_serializable` package is implemented for generating `toJson` and `fromJson` methods, making it easier to work with JSON.

8. **Package and App Name Configuration**
    - You can easily change the package name and app name. The necessary packages for this task are already installed.

9. **Theme Configuration**
    - The template includes a theme configuration. You can modify it to suit your needs.

10. **Localization Configuration**
- The template includes a localization configuration. You can modify it to suit your needs.

11. **Custom Snack Bars**
- The template includes a Custom Snack Bars. You can modify it to suit your needs.

12. **Added Deep Linking Files**
    - Deep linking is used to open app from links (FYI when you want deep linking to work you need to configure routes) you can find deep linking files in /deeplinking_file
      folder. Also upload this files in .well-known and do the setup of deep linking


## Getting Started

Currently, we are using Flutter version `3.22.2` and Dart version `3.4.3`.

### Initial Setup Steps:

1. **Open your terminal and navigate to the project directory.**
2. Run the following commands based on your operating system:

    - **For macOS:**
      ```bash
      make initial_setup_commands
      ```

    - **For Windows:**
        - If you haven't installed `make` yet, refer to this guide: [How to Run a Makefile in Windows](https://medium.com/@samsorrahman/how-to-run-a-makefile-in-windows-b4d115d7c516).
        - Once `make` is installed, run:
          ```bash
          make initial_setup_commands
          ```
        - Alternatively, you can manually execute the commands listed under `initial_setup_commands` in the `Makefile`.

After completing these steps, you should be all set to run the project.

## SharedPreference Helper
You can find these file in following directory : /lib/data/utils/my_shared_pref.dart
You can update this file as per your needs

## Firebase Helper
You can find these file in following directory : /lib/data/utils/firebase_helper.dart
To use this firebase helper you need to configure firebase into you flutter project.
You will find all the configuration about notification, Remote Config, crashlytics.
1. Firebase Notifications (We have also configured awesome_notifications).
2. Firebase Remote Configuration
3. Firebase Crashlytics

##### Important Note
IOS require few more steps from your side to receive fcm notifications follow the [Docs](https://firebase.flutter.dev/docs/messaging/apple-integration/) steps and after that everything should be working fine from flutter side


## API Integration

You can find API Integrations related files in following directory : /lib/domain folder.
we have everything related to API integrations.
We are using DIO client for making API calls.
Please use following https methods like this
   ```bash
    DioAPIClient.get({please put necessary function parameters})
    DioAPIClient.post({please put necessary function parameters})
    DioAPIClient.put({please put necessary function parameters})
    DioAPIClient.delete({please put necessary function parameters})
   ```

There is a authentication interceptor in following directory: /lib/domain/network/interceptors/authentication_interceptor.dart
Please write a `Authorization` headers in authentication_interceptor.dart file.

## Asset and Color Management with flutter_gen

##### Important Note
Whenever you add new images or svg's run following command and also read about flutter_gen to know more:

- **For macOS:**
   ```bash
   make gen
   ```

- **For Windows:**
    - If you haven't installed `make` yet, refer to this guide: [How to Run a Makefile in Windows](https://medium.com/@samsorrahman/how-to-run-a-makefile-in-windows-b4d115d7c516).
    - Once `make` is installed, run:
      ```bash
      make gen
      ```
    - Alternatively, you can manually execute the commands listed under `gen` in the `Makefile`.


   ```bash
    Assets.images.samplePng.image();
    Assets.images.sampleSvg.svg();
   ```

## Icon Management with flutter_icons
Change app launch icon (replace assets/logo/app_icon.png with your app icon) then run this command
   ```
   dart run flutter_launcher_icons:main
   ```

## JSON Serialization with json_serializable
Please refer `json_serializable` [package](https://pub.dev/packages/json_serializable) to create toJson and fromJson.

## Package and App Name Configuration
- Change app package name
    ```
    flutter pub run change_app_package_name:main com.new.package.name
    ```

- Change app name
    ```
    flutter pub run rename_app:main all="My App Name"
    ```

## Theme Configuration

- Change theme
   ```dart
   MyTheme.changeTheme()
   ```

- Check current theme
   ```dart
   bool isThemeLight = MyTheme.getThemeIsLight()
   ```

## Localization Configuration

- Change app locale
   ```dart
   LocalizationService.updateLanguage('en')
   ```

- Get current locale

    ```dart
    LocalizationService.getCurrentLocal()
    ```
- Use translation

   ```dart
   Text(Strings.hello.tr)
   ```

## Custom Snack Bars

Use following functions to show snack bars
   ```dart
    CustomSnackBar.showCustomSnackBar(title: 'Done successfully!', message: 'item added to wishlist')
    CustomSnackBar.showCustomErrorSnackBar(title: 'Failed!', message: 'failed to load data')
    CustomSnackBar.showCustomToast(message: 'added to card')
    CustomSnackBar.showCustomErrorToast(message: 'added to card')
   ```

## Deep Linking Setup

    For Android: 
        In android/app/src/main/AndroidManifest.xml file please find these following tag
        <meta-data
            android:name="flutter_deeplinking_enabled"
            android:value="true" />
        You will find the comment there please do the needful changes

    For IOS got to Signing Capabilities and add Assiciates Domains
        Add domain in follwoing format:  applinks:domainname.com


## Keystore Credentials
- Alias : ``
- Password : ``
- JKS file : _Contact With Project Manager_

**⚠️ Warning**
> _This is confidential information do not share with others._

## Technical Requirements
Zenput uses the number of open source projects to work properly
- Flutter
- Java/Kotlin
- Swift

## Development Requirements
- Flutter Version : `3.22`
- Dart Version : `3.4.0`
- Java (Android Studio Default JDK) : `17.0.4`

## Gitlab
Zenput using `gitlab` powerful version control system to keep track of
changes to your project. Below are the branches.
- `main`
- `development`
- `production`


## Project Structure
``` css
.
├── android
├── deeplinking_files
│   └── .well-known
├── ios
├── assets
│   ├── color
│   ├── google_fonts
│   ├── images
│   │   ├── icons
│   │   └── images
│   ├── logo
│   └── svg
├── lib
│   ├── config
│   │   ├── custom_packages
│   │   ├── gen
│   │   ├── theme
│   │   └── translations
│   ├── data
│   │   ├── bindings
│   │   ├── controllers
│   │   ├── middlewares
│   │   ├── models
│   │   ├── services
│   │   └── utils
│   ├── domain
│   │   ├── network
│   │   └── repository
│   ├── presentation
│   │   └── custom_widgets
│   └── main.dart
├── web
├── Makefile
└── pubspace.yaml
```


## Library Used
Please follow following format:-
|Name|Description|Link|
|:--:|:--:|:--:|
|`get`| We are using `getx` for `state`, `route`, `theme` & `localization` management.| [View](https://pub.dev/packages/get)|



## Payment Gateway

What are the main steps/events that happen in a payment gateway?
Every payment Gateway uses these steps before redirecting users to the payment page.

1. Initiate payment. // Collects user inputs, such as Amount, currency, name,email,Number etc...
2. Create Order.  // Collected data now sent to Payment Gateway server, which creats an Order and generates an unique Order ID 
3. create a session for that Order
4. Give Session Web URL, where the user will interact and make Payments.

When a user clicks on the 'Pay' button, they will not see the first three processes and will need to wait for a few seconds.
After this wait, the user is directly redirected to the web session.

If you want to send a session link to the user's email,
hold on after creating the session and send it to your server, which will then send an email with the payment session link.
In this example we have integrated Two Payment Gateway for your reference

We have added direct link to Official Docs, please checkout them for more detailed Explanations.
1. [CashFree](https://docs.cashfree.com/docs/flutter-integration)
2. [Stripe](https://pub.dev/packages/flutter_stripe)

firstly, Lets start with CashFree integration in Flutter
### Cashfree

Requirements :-
checkout [cashfree flutter sdk](https://pub.dev/packages/flutter_cashfree_pg_sdk) for latest version and how to use it.
```agsl
dependencies:
    flutter_cashfree_pg_sdk: ^2.1.3+33
```

we will be using sandbox for creating order in Test Mode
[create cashfree Order](https://sandbox.cashfree.com/pg/orders)

```agsl

    final headers = {
      'Content-Type': 'application/json',
      'x-client-id': appId,
      'x-client-secret': secretKey,
      'x-api-version': '2025-01-01',
    };

    final data = {
      'order_id': 'enter your unique id or UUID',
      'order_amount': orderamount,
      'order_currency': 'INR',
      'customer_details': {
        'customer_id': 'CUST001',
        'customer_email': "abcd@gmail.com",
        'customer_phone': "9000012345",
      },
      'order_note': 'Test Order',
      'order_meta': {
        'return_url':
            'https://example.com/return', // Replace with your return URL
      },
    };
```

if you want to get status of recently created orders then visit [fetch order](https://docs.cashfree.com/reference/pgfetchorder)

To know more about Cashfree integration in flutter, or Latest doc kindly visit to [official cashfree site](https://docs.cashfree.com/docs/flutter-integration)

### Stripe
Android
This plugin requires several changes to be able to work on Android devices. Please make sure you follow all these steps:

1. Use Android 5.0 (API level 21) and above
2. Use Kotlin version 1.5.0 and above: example
3. Requires Android Gradle plugin 8 and higher
4. Using a descendant of Theme.AppCompat for your activity: example, example night theme

```
// example
// go to file android/app/src/main/res/values/styles.xml
// you can add these lines 

   <style name="NormalTheme" parent="Theme.MaterialComponents">
        <item name="android:windowBackground">?android:colorBackground</item>
    </style>
```

5. Using an up-to-date Android gradle build tools version: example and an up-to-date gradle version accordingly: example
6. Using FlutterFragmentActivity instead of FlutterActivity in MainActivity.kt: example
7. Add the following rules to your proguard-rules.pro file: example

```
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivity$g
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Args
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Error
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningEphemeralKeyProvider
```
 Rebuild the app, as the above changes don't update with hot reload


For Stripe Integration you need Two keys

1. Stripe's Publishable key
2. Stripe's Secret Key

**Don't have Stripe key's?** [get from here](https://dashboard.stripe.com/test/apikeys) .

**Note**: This Key's should be kept confidential for any data leak.

**Here we have used `.env` for keeping Key's within project.**

**Make sure** to add `.env` file to `.gitignore`, for unnecessary data leak

To use `.env` file's data in flutter app, you will need to follow below steps

create a file `.env` in root directory of Flutter project

``` css

├── android
├── assets
├── ios
├── lib
├── web
├── .env
└── pubspec.yaml
```

store key's in `.env` file 

```
STRIPE_SECRET=sk_test_51Pxxxxxxx
STRIPE_PUBKEY=pk_test_51Py9xxxxxxxx
```

Add `.env` file under assets in pubspec.yaml
```
assets:
  - .env
```
use [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) flutter package to read .env file data

install __flutter_dotenv__ package with command
```agsl
flutter pub add flutter_dotenv
```

Or directly add in pubspec.yaml under dependencies

```agsl
dependencies:
  flutter_dotenv: ^5.1.0
```
and run flutter pub get after that

Loads `.env` file in main.dart

```
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
}
```
using env data in flutter app
```
 headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        }
```


#   n i m a p _ b a s e _ p r o j e c t  
 