[![Release](https://img.shields.io/badge/Version-^0.1.20-success.svg?style=for-the-badge)](https://shields.io/)
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

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```dart
dependencies:
  app_wrapper: ^0.1.20
```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

Lastly:

Import it like so:

```dart
import 'package:app_wrapper/app_wrapper.dart';
```
