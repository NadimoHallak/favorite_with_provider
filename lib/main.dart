import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_favorite_project/favorit.dart';
import 'package:provider_favorite_project/provider/favorit_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final words = nouns.take(50).toList();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          var word = words[index];
          return ListTile(
            title: Text(word),
            trailing: IconButton(
              onPressed: () {
                provider.CheckFavorite(word);
              },
              icon: provider.isExist(word)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavoritPage()),
          );
        },
        label: const Text('Favorite'),
      ),
    );
  }
}
