[![Release](https://img.shields.io/badge/Version-^0.1.33-success.svg?style=for-the-badge)](https://shields.io/)
[![Maintained](https://img.shields.io/badge/Maintained-Actively-informational.svg?style=for-the-badge)](https://shields.io/)

# app_wrapper

`sil_app_wrapper` is an open source project &mdash; it's one among many other shared libraries that make up the wider ecosystem of software made and open sourced by `Savannah Informatics Limited`.

It is a shared library between [BeWell-Consumer] and [BeWell-Professional] and is responsible for putting together everything that these app needs in order to run safely.

## Installation Instructions

Use this package as a library by depending on it

Run this command:

- With Flutter:

```dart
$ flutter pub add app_wrapper
```

This will add a line like this to your package's `pubspec.yaml` (and run an implicit dart pub get):

```dart
dependencies:
  app_wrapper: ^0.1.33
```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

Lastly:

Import it like so:

```dart
import 'package:app_wrapper/app_wrapper.dart';
```

## Usage

Lets take a look at how to use AppWrapper to hook up a your application.

```dart

class YourApp extends StatelessWidget {
  const YourApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      appName: appName,
      eventBus: EventBus(),
      graphQLClient: GraphQlClient(
      'id_token',
      'endpoint_url',
      ),
      appContexts: <your_app_Contexts>,
      child: YourAppEntryWidget(),
    );
  }
}
```

With the above snippet, we have successfully hooked up our app to use `AppWrapper`. Your application's element tree now has access to `DeviceCapabilities`, `graphQLClient` etc, that is passed down. These include Device Camera, Device BiometricType (face or fingerprint) and Endpoints.

Provided [here](https://github.com/savannahghi/app_wrapper/blob/main/example/main.dart) is a more detailed snippet, on how to use the package.

## Dart & Flutter Version

- Dart 2: >= 2.12
- Flutter: >=2.0.0
