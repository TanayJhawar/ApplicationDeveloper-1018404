// task2.dart
import 'dart:convert';
import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  final String jsonResponse;

  Task2(this.jsonResponse);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> decodedResponse = jsonDecode(jsonResponse);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task 2'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'People by Training and Fiscal Year:',
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
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        key,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          value.length,
                          (index) => Text(value[index]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
