// Character - class to inform character information
class Character {
  String? name;
  String? imgUrl;
  int? id;

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imgUrl = json['imgUrl'];
    id = json['id'];
  }
}
