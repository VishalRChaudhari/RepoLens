import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:repolens/secrets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late Future<List<dynamic>> _photos;

  Future<List<dynamic>> getPhotos(String query) async {
    final url = Uri.parse(
        'https://pixabay.com/api/?key=$imageKey&q=$query&image_type=photo&per_page=15');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['hits'];
    } else {
      throw Exception('Failed to load images');
    }
  }

  fullScreenImage(String imageUrl) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async {}, icon: const Icon(Icons.bookmark))
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(imageUrl),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _photos = getPhotos('tree');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: _photos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No images found'));
          } else {
            final photos = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: photos.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final photo = photos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            fullScreenImage(photo['largeImageURL']),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      photo['webformatURL'],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
