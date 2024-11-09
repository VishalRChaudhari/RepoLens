import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:repolens/secrets.dart';

class Repo extends StatelessWidget {
  const Repo({super.key});
  Future<List<dynamic>> getRepos() async {
    final response = await http.get(Uri.parse(gitApiKey));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
 //   Color mycolor = const Color.fromARGB(255, 180, 208, 211);
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
            return Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                  title: Text(
                    repo['description'] ?? 'No Description',
                    style: const TextStyle(fontSize: 17),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        repo['name'] ?? "Unknown Repo",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "Comments: ${repo['comments']},  Created: ${repo['created_at']}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
            );
          },
        );
      },
    );
  }
}
