class User {
  final int id;
  final String name;
  final String avatarUrl;
  final String address;
  final String description;

  User({this.id, this.name, this.avatarUrl, this.address, this.description});

  User.fromJson(Map<String, dynamic> jsonObject)
      : id = int.parse(jsonObject['id']),
        name = jsonObject['name'],
        address = jsonObject['address'],
        avatarUrl = jsonObject['avatar_url'],
        description = jsonObject['description'];

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'name': name,
        'address': address,
        'avatar_url': avatarUrl,
        'description': description
      };
}
