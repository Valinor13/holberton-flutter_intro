import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';
import 'character_tile.dart';

// HomeScreen - class that renders the home page
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // fetchBbCharacters - fetches the character data from the API
  // returns: Future<List<Character>>
  Future<List<Character>> fetchBbCharacters() async {
    final response =
        await http.get(Uri.parse('https://breakingbadapi.com/api/characters'));
    if (response.statusCode == 200) {
      final chars = json.decode(response.body);
      // loop through chars and create new Character() for each
      return chars.map<Character>((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  // build - overrides the build method
  //         builds Scaffold for return
  //         appBar - Breaking Bad Quotes
  //         body - FutureBuilder
  // @context: I have no clue what this is yet
  // Return: the Scaffold widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad Quotes'),
      ),
      // FutureBuilder -
      //  future argument is data returned from fetchBbCharacters()
      //  builder - function that builds the UI
      //  @context: Still not sure what this is
      //  @snapshot: The snapshot of the data
      //  Return: if snapshot data, return GridView.builder()
      //          if error, return center widget with text 'Error'
      //          if loading: return center widget circularProgressIndicator()
      body: FutureBuilder(
        future: fetchBbCharacters(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return CharacterTile(
                    character: snapshot.data?[index],
                  );
                },
              );
            }
          } else {
            return const Center(
                child: Text('Error'),
              );
          }
        },
      ),
    );
  }
}
