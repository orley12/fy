class PreferenceRepository {
  void setStringPref(String settingKey, String newChoice) async {}

  getStringPref(String settingKey) {}

  getSettings() async {}

  void setBooleanPref(String settingKey, bool newChoice) async {}

  getBooleanPref(String settingKey) async {}

  void setIntPref(String settingKey, int newChoice) async {}

  Future<int?> getIntPref(String settingKey) async {}
}
