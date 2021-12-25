import 'package:food_yours_customer/common/repository/preference_repository/preference_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepositoryImpl implements PreferenceRepository {
  late SharedPreferences _pref;

  PreferenceRepositoryImpl._();

  static Future<PreferenceRepository> getInstance() async {
    PreferenceRepositoryImpl preferenceRepository =
        PreferenceRepositoryImpl._();
    await preferenceRepository._init();
    return preferenceRepository;
  }

  Future<void> _init() async {
    _pref = await SharedPreferences.getInstance();
  }

  SharedPreferences get value => _pref;

  @override
  void setStringPref(String settingKey, String newChoice) {
    _pref.setString(settingKey, newChoice);
  }

  @override
  String getStringPref(String settingKey) {
    return _pref.getString(settingKey) ?? "";
  }

  @override
  Future<Set<String>> getSettings() async {
    return _pref.getKeys();
  }

  @override
  void setBooleanPref(String settingKey, bool newChoice) {
    _pref.setBool(settingKey, newChoice);
  }

  @override
  Future<bool?> getBooleanPref(String settingKey) async {
    return _pref.getBool(settingKey);
  }

  @override
  void setIntPref(String settingKey, int newChoice) {
    _pref.setInt(settingKey, newChoice);
  }

  @override
  Future<int> getIntPref(String settingKey) async {
    return _pref.getInt(settingKey) ?? 0;
  }
}
