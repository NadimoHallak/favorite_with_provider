import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_favorite_project/provider/favorit_provider.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritProvider>(context);
    var words = provider.Words;
    return Scaffold(
      appBar: AppBar(),
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
    );
  }
}
