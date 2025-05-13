class AppLogger {
  static void log(String message) {
    final now = DateTime.now();
    print("[\$now] \$message");
  }
}
