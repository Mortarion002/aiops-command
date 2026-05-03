class AppUser {
  final String id;
  final String email;
  final String name;
  final int? age;
  final String? photoUrl;

  const AppUser({
    required this.id,
    required this.email,
    required this.name,
    this.age,
    this.photoUrl,
  });

  AppUser copyWith({
    String? id,
    String? email,
    String? name,
    int? age,
    String? photoUrl,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      age: age ?? this.age,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'age': age,
      'photoUrl': photoUrl,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map, String id) {
    return AppUser(
      id: id,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      age: map['age']?.toInt(),
      photoUrl: map['photoUrl'],
    );
  }
}
