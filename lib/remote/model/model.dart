class User {
  final String id;
  final String name;
  final String description;

  User({
    required this.id,
    required this.name,
    required this.description,
  });

  static User fromJason(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        description: json['description'],
      );
}
