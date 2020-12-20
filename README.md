# app

## 1. Introduction
This part is use to introduce your application

## 2. Setup Flutter environment
If you are totally new to Flutter or not know what is it, you probably will want to read [Flutter's document](https://flutter.dev/docs) first. Or, if you do not install Flutter on your computer yet, please follow [Flutter official install instruction](https://flutter.dev/docs/get-started/install) to set up everything.

## 3. Setup and run the application
Step 1: Clone the repository from GitHub:
```bash
$ git clone git@github.com:quikapp/app.git
```
or fork it from repository. If you don't know how to fork, check [this](https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo).


Step 2: install all dependencies: 
```bash
$ flutter pub get
```

Step 3: Run project on virtual machine
Open your simulator (to simulate iOS devices) or emulator (to emulate Android devices) and then run 
```bash
$ flutter run
```
inside your project's terminal. And then we done!


Step 4 (optional): run automation test cases
```bash
$ flutter test
```
## 4. Build app
### 4.1. Build for test
If you are developing app and want to build `.apk` file or `.ipa` file for testing purpose, only need to run
```bash
$ flutter build apk
```
to generate `.apk` file, or
```bash
$ flutter build ipa
```
to generate `.ipa` file.
### 4.2. Build for release
When we are ready to build a release version of the application to deploy on the store, everything will be more complicated. Flutter team describes it very detailed about [Build and release Android app](https://flutter.dev/docs/deployment/android) and [Build and release iOS app](https://flutter.dev/docs/deployment/ios) in their document. And I think I cannot do it better than them. So, please follow Flutter's official instructions for that.

## 5. Third party library
This is a list of 3rd party library we use inside of application. Every time we add a new library, 
we will list it in here to keep in track.


The list is: 
- [Dio](https://pub.dev/packages/dio/install) to call Http request.
- [Flutter StatusBar Color](https://pub.dev/packages/flutter_statusbarcolor) to control color
of Status Bar inside app.
- [Provider](https://pub.dev/packages/provider) to manage global state in application. Suggested by Flutter team in their 
[official document](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).
- [Flutter Localization](https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html),
a library suggested by Flutter team (read [here](https://flutter.dev/docs/development/accessibility-and-localization/internationalization))
to support multiple language in app.
- [Shared Preferences](https://pub.dev/packages/shared_preferences) to store small pieces of data (like caching data)
- [Test](https://pub.dev/packages/test) and [Mockito](https://pub.dev/packages/mockito) for testing purpose, 
follow [Flutter testing documentation](https://flutter.dev/docs/testing)
- [Carousel Slider](https://pub.dev/packages/carousel_slider) for make a carousel in HomeScreen
- [Easy Localization](https://pub.dev/packages/easy_localization) for localization in app

## 6. Folder structure
From my experience, I will use the structure below. If you guys find anything unreasonable or can
 be improved in this structure, please let me know. 
- `lib`: this folder to contain the main code part of our application
  - `app`: this folder contain widget of Quik App
  - `business_logic`: this folder use to contain the main business logic inside of application
  . Example, for now, this part will contain `app_date_time.dart` to process all of date time
   logic inside of app.
  - `entities`: this folder contain the entities using for client side in app. 
  - `repository`: is the repository of app.
    - `database`: using for store caching data into local database. Some data will not always
     need to call from backend.
    - `network`: to get data from server side
  - `res`: the folder contain all resource of application
    - `fonts`: custom font using in app
    - `images`: all images using inside app
    - `strings`: all strings inside app. For now, this app have only 1 language. But we can
     add more language later by adding more JSON file into this folder. For example: `thai.json
     `, `vi.json`, ect.
  - `route`: manage route (navigation) inside of application
  - `utils`: folder to store any kind of helper that you have, such as Themes, Colors, Images
   Directory, etc.
  - `view_model`: this is a state management part in this application. I've separated the state
   and UI of the app into two separate layers. This layer use to manage state in app.
  - `widget`: this is a UI layer. All files in here have only 1 mission: display UI of app.
- `main.dart`: entry point of your application as per Flutter standards.


## 7. Rules 
In this part, we will define rules for the whole project. Rule could be changed, but every developer need to follow it. Otherwise, source code will be inconsistent 
### 7.1. Naming convention
- name of files and folders: using snake_case rule. For example: `account_screen` (not `AccountScreen`, not `accountScreen`)
- name of variables: using camelCase rule. For example `var splashModel;`
- name of class: using PascalCase rule. For example `class SplashScreen extends StatelesWidget`
Read more about type cases in [here](https://medium.com/better-programming/string-case-styles-camel-pascal-snake-and-kebab-case-981407998841)
### 7.2. Git branch and workflow

... to be continuing
