/// Flavor configuration for the Ahara app.
///
/// Three environments: dev, staging, prod.
/// Selected via `--dart-define=FLAVOR=<value>` or native build flavors.
enum Flavor {
  /// Local development against the Django backend.
  dev,

  /// Staging environment (TBD).
  staging,

  /// Production environment.
  prod;

  /// Parses a [Flavor] from a string value.
  ///
  /// Returns [Flavor.dev] if [value] is null or unrecognized.
  static Flavor fromString(String? value) {
    if (value == null) return Flavor.dev;
    return Flavor.values.firstWhere(
      (f) => f.name == value.toLowerCase(),
      orElse: () => Flavor.dev,
    );
  }
}
