import 'package:flutter/material.dart';
import 'models.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Text(character.imgUrl),
    );
  }
}
