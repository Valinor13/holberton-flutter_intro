import 'package:flutter/material.dart';
import 'quotes_screen.dart';
import 'models.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuotesScreen(
                name: character.name,
              ),
            ),
          );
        },
        child: Image.network(
          character.imgUrl,
          fit: BoxFit.cover,
        )
      ),
      footer: GridTileBar(
        title: Text(
          character.name,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
