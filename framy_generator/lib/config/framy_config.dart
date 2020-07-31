class FramyConfig {
  /// Specified in FramyApp annotation
  bool useDevicePreview;

  /// Specified in config yaml file
  /// wrap-with-devicepreview: true
  bool wrapWithDevicePreview;

  /// Specified in config yaml file
  /// wrap-with-scaffold: true
  bool wrapWithScaffold;

  /// Specified in config yaml file
  /// wrap-with-center: true
  bool wrapWithCenter;

  /// Specified in config yaml file
  /// wrap-with-safearea: true
  bool wrapWithSafeArea;

  /// Specified in config yaml file
  /// show-material-components: true
  bool showMaterialComponents;

  /// Specified in config yaml file
  /// show-storyboard: true
  bool showStoryboard;
}
