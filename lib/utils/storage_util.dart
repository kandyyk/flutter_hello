part of utils;

class Storage {
  static setData(String key, dynamic value) async {
    var sp = await SharedPreferences.getInstance();
    sp.setString(key, jsonEncode(value));
  }

  static getData(String key) async {
    try {
      var sp = await SharedPreferences.getInstance();
      String? s = sp.getString(key);

      if (s != null) {
        return json.decode(s);
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return e.toString();
    }
  }

  static removeData(String key) async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  static clearData() async {
    var sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
