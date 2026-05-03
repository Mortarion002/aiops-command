class AppUser {
  final String id;
  final String email;
  final String name;
  final int? age;

  const AppUser({
    required this.id,
    required this.email,
    required this.name,
    this.age,
  });

  AppUser copyWith({
    String? id,
    String? email,
    String? name,
    int? age,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'age': age,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map, String id) {
    return AppUser(
      id: id,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      age: map['age']?.toInt(),
    );
  }
}
