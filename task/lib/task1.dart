import 'dart:convert';
import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  final String jsonResponse;

  Task1(this.jsonResponse);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> decodedResponse = jsonDecode(jsonResponse);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task 1'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Each completed training with a count of how many people have completed that training:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: decodedResponse.length,
              itemBuilder: (context, index) {
                var key = decodedResponse.keys.elementAt(index);
                var value = decodedResponse[key];
                return ListTile(
                  title: Text('$key: $value'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
