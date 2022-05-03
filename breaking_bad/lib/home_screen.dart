import 'dart:convert';
import 'models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// HomeScreen - class that renders the home page
class HomeScreen extends StatelessWidget {
   const HomeScreen({Key? key}) : super(key: key);
  // fetchBbCharacters - fetches the character data from the API
  Future<List<Character>> fetchBbCharacters() async {
    final response =
        await http.get(Uri.parse('https://breakingbadapi.com/api/characters'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
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
      //          if loading: return center widget with circularProgressIndicator()
      body: FutureBuilder(
        future: fetchBbCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(snapshot[index]["name"]),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(snapshot[index]['imgUrl']),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
