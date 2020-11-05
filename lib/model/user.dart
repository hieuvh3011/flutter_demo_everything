class User {
  final String id;
  final String name;
  final String avatarUrl;
  final String address;

  User(this.id, this.name, this.avatarUrl, this.address);

  User.fromJson(Map<String, dynamic> jsonObject)
      : id = jsonObject['id'],
        name = jsonObject['name'],
        address = jsonObject['address'],
        avatarUrl = jsonObject['avatar_url'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'address': address, 'avatar_url': avatarUrl};
}
