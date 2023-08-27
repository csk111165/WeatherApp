# weather_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
[online documentation](https://docs.flutter.dev/), which offers tutorials,


## Notes and links
* If we use http module, we won't be able to able to use `get` or `post` directly we need to perform this step otherwise it will
  throw client error : 
  * Go to flutter\bin\cache and remove flutter_tools.stamp file

  * Go to flutter\packages\flutter_tools\lib\src\web open file chrome.dart and edit it Add '--disable-web-security' and comment '--disable-extensions' line. 
  * See the stackoverflow link [link](https://stackoverflow.com/questions/60191683/xmlhttprequest-error-in-flutter-web-enabling-cors-aws-api-gateway)