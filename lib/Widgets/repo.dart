import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:repolens/secrets.dart';

class Repo extends StatelessWidget {
  const Repo({super.key});
  Future<List<dynamic>> getRepos() async {
    final response =
        await http.get(Uri.parse(gitApiKey));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRepos(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var repo = snapshot.data![index];
            return ListTile(
              title: Text(repo['description'] ?? 'No description'),
              subtitle: Text(
                  "Comments: ${repo['comments']},  Created: ${repo['created_at']}"),
            );
          },
        );
      },
    );
  }
}
