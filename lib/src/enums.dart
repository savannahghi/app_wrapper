/// [AppContext] a finite enum of environments where savannah mobile apps run
enum AppContext {
  /// [BewellCONSUMER] savannah bewell consumer
  BewellCONSUMER,

  /// [BewellPRO] savannah bewell professional
  BewellPRO,

  /// [AfyaMoja] Open sourced AfyaMoja
  AfyaMoja,

  /// [AppTest] app running on test environment. This indicates that the will call a specific
  /// endpoint specifically for testing
  AppTest,

  /// [AppDemo] app running on demo environment. This indicates that the will call a specific
  /// endpoint specifically for demo
  AppDemo,

  /// [AppProd] app running on prod environment. This indicates that the will call a specific
  /// endpoint specifically for production
  AppProd,

  /// [AppE2E] app running in E2E environment. This indicates that the will
  /// call a specific endpoint for E2E testing
  AppE2E,
}
