import 'package:shared_preferences/shared_preferences.dart';

const EXAMPLE = 'EXAMPLE';

abstract class LocalDataSource {
  Future<String> getExample();

  Future<void> saveExample(String userId);
}

class LocalDataSourceImpl implements LocalDataSource {
  SharedPreferences sharedPreferences;

  LocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<String> getExample() async {
    return sharedPreferences.getString(EXAMPLE);
  }

  @override
  Future<void> saveExample(String example) async {
    return sharedPreferences.setString(EXAMPLE, example);
  }
}
