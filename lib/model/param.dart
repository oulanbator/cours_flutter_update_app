class Param {
  final int id;
  final String key;
  final String value;

  Param({required this.id, required this.key, required this.value});

  Param.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        key = json["key"] as String,
        value = json["value"] as String;
}
