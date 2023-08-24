class DataUtil{
  static List<T>? jsonToList<T>(
      String name,
      Map<String, dynamic> json,
      T Function(Map<String, dynamic> json) formJson,
      ) {
    List<T>? list;
    if (json[name] != null && json[name] is List) {
      List fileList = json[name];
      list = fileList.map((json) => formJson(json)).toList();
    }

    if (list == null) return null;
    return list;
  }
}