import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:api/models/posts_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Integration"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading');
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(postList[index].toString()),
                          ),
                          subtitle: Text(postList[index].title.toString()),
                          title: Text(postList[index].title.toString()),
                        );
                      }),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
