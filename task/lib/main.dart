import 'package:flutter/material.dart';
import 'task1.dart'; // Import the Task1 file
import 'task2.dart'; // Import the Task2 file
import 'task3.dart'; // Import the Task3 file
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Programming Tasks'),
        ),
        body: Center(
          child: MyButtonWidget(),
        ),
      ),
    );
  }
}

class MyButtonWidget extends StatelessWidget {
  Future<void> callPythonApi(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/completed-trainings'),
      );

      if (response.statusCode == 200) {
        print('API response: ${response.body}');
        _navigateToResponseScreen(context, response.body);
      } else {
        print('Failed to call Python API. Status code: ${response.statusCode}');
        // Handle the error
      }
    } catch (error) {
      print('Error calling Python API: $error');
      // Handle the error
    }
  }

  Future<void> callTask2Api(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/task2'),
      );

      if (response.statusCode == 200) {
        print('API response: ${response.body}');
        _navigateToTask2ResponseScreen(context, response.body);
      } else {
        print('Failed to call Task2 API. Status code: ${response.statusCode}');
        // Handle the error
      }
    } catch (error) {
      print('Error calling Task2 API: $error');
      // Handle the error
    }
  }

  Future<void> callTask3Api(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/task3'),
      );

      if (response.statusCode == 200) {
        print('API response: ${response.body}');
        _navigateToTask3ResponseScreen(context, response.body);
      } else {
        print('Failed to call Task3 API. Status code: ${response.statusCode}');
        // Handle the error
      }
    } catch (error) {
      print('Error calling Task3 API: $error');
      // Handle the error
    }
  }

  void _navigateToResponseScreen(BuildContext context, String jsonResponse) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Task1(jsonResponse),
      ),
    );
  }

  void _navigateToTask2ResponseScreen(BuildContext context, String jsonResponse) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Task2(jsonResponse),
      ),
    );
  }

  void _navigateToTask3ResponseScreen(BuildContext context, String jsonResponse) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Task3(jsonResponse),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: () {
              // Call Python API when Button 1 is pressed
              callPythonApi(context);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
            ),
            child: Text(
              'Task 1',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 4), // Decreased height between buttons
        Container(
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: () {
              // Call Task2 API when Button 2 is pressed
              callTask2Api(context);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
            ),
            child: Text(
              'Task 2',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 4), // Decreased height between buttons
        Container(
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: () {
              // Call Task3 API when Button 3 is pressed
              callTask3Api(context);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
            ),
            child: Text(
              'Task 3',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
