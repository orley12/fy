extension I on String {
  String get first {
    return this.length > 0 ? this.substring(0, 1) : "";
  }
}
