enum DeviceScreenType { Mobile, Tablet, Desktop }

/// [AppContext] a finite enum of environments where savannah flutter apps
/// run
enum AppContext {
  /// [BewellCONSUMER] savannah bewell consumer
  BewellCONSUMER,

  /// [BewellPRO] savannah bewell professional
  BewellPRO,

  /// [AppTest] app running on test environment. This indicates that the will call a specific
  /// endpoint specifically for testing
  AppTest,

  /// [AppDemo] app running on demo environment. This indicates that the will call a specific
  /// endpoint specifically for demo
  AppDemo,

  /// [AppProd] app running on prod environment. This indicates that the will call a specific
  /// endpoint specifically for production
  AppProd,
}
