import 'dart:convert';

class City {
  final int id;
  final String name;
  final String country;

  City({
    required this.id,
    required this.name,
    required this.country,
  });

  static fromJson(final String json) {
    final map = jsonDecode(json);
    return City.fromMap(map);
  }

  static City fromMap(final Map<String, dynamic> map) => City(
    id: map['id'],
    name: map['name'],
    country: map['country'],
  );

  String toJson() => jsonEncode({
    'id': id,
    'name': name,
    'country': country,
  });
}
