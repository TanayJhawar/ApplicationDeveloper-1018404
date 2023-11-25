// task3.dart
import 'dart:convert';
import 'package:flutter/material.dart';

class Task3 extends StatelessWidget {
  final String jsonResponse;

  Task3(this.jsonResponse);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> decodedResponse = List<Map<String, dynamic>>.from(jsonDecode(jsonResponse));

    return Scaffold(
      appBar: AppBar(
        title: Text('Task 3'),
      ),
      body: ListView.builder(
        itemCount: decodedResponse.length,
        itemBuilder: (context, index) {
          var completion = decodedResponse[index];
          var name = completion['name'];
          var completions = List<Map<String, dynamic>>.from(completion['completions']);

          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Name: $name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: completions.length,
                  itemBuilder: (context, index) {
                    var completionDetails = completions[index];
                    var expiredStatus = completionDetails['expired_status'];
                    var expires = completionDetails['expires'];
                    var completionName = completionDetails['name'];
                    var timestamp = completionDetails['timestamp'];

                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Completion: $completionName',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Expired Status: $expiredStatus',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Expires: $expires',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Timestamp: $timestamp',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
