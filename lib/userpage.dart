import 'dart:convert';

import 'package:api/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> user = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        user.add(UserModel.fromJson(i));
      }
      return user;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return Expanded(
                      child: ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            children: [
                              ReRow(
                                  title: 'Name',
                                  value: user[index].name.toString()),
                              ReRow(
                                  title: 'username',
                                  value: user[index].username.toString()),
                              ReRow(
                                  title: 'street',
                                  value:
                                      user[index].address!.street.toString()),
                              ReRow(
                                  title: 'lat',
                                  value:
                                      user[index].address!.geo!.lat.toString()),
                              ReRow(
                                  title: 'Name',
                                  value: user[index].name.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ));
                }
              })
        ],
      ),
    );
  }
}

class ReRow extends StatelessWidget {
  final String title, value;
  const ReRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
