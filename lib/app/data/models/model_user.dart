typedef Json = Map<String, dynamic>;

class UserModel {
  UserModel({
    this.id,
    this.image,
  });

  factory UserModel.fromJson(Json json) {
    return UserModel(
      id: json['id'] as String,
      image: json['image'] as String,
    );
  }
  Json get json => {
        'id': id,
        'image': image,
      };
  final String? id;
  final String? image;
}
