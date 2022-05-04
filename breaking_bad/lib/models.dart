// Character - class to inform character information
class Character {
  late String name;
  late String imgUrl;
  late int id;

  Character({
    required this.name,
    required this.imgUrl,
    required this.id,
  });

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imgUrl = json['img'];
    id = json['char_id'];
  }
}
