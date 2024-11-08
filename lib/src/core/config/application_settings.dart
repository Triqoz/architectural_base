/// Enumerates the different environments the application can be build against.
enum Environments {
  /// Indicates that the application is running against the development
  /// environment.
  development,

  /// Indicates that the application is running against the staging environment.
  staging,

  /// Indicates that the application is running against the production
  /// environment.
  production,
}

/// Provides type safe access to different compile-time application settings
/// that supplied to the application when being compiled.
class ApplicationSettings {
  /// The environment against which the application is build.
  static Environments get environment {
    const String env = String.fromEnvironment(
      'ENVIRONMENT',
      defaultValue: 'dev',
    );

    return switch (env) {
      'dev' || 'development' => Environments.development,
      'stg' || 'staging' => Environments.staging,
      'prod' || 'production' => Environments.production,
      _ => throw UnsupportedError(
          'The ENVIRONMENT \'$env\' is not supported. Valid values are \'dev\', \'stg\' or \'prod\'.',
        ),
    };
  }
}
