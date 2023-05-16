import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  @override
//   const BudgetScreen({Key? key}) : super(key: key);
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  String Budget = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    //Replace with proper endpoint
    String url = 'https://localhost:3001/get_endpoint';

    try {
      http.Response response = await http.get(Uri.parse(url));
      //nonerror status code
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        setState(() {
          Budget = responseData['field'];
        });
      } else {
        print("Request failed with code ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Displaying Text:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(Budget),
            // Text(
            //   'Hello, World!',
            //   style: TextStyle(fontSize: 16.0),
            // ),
            SizedBox(height: 20.0), // Adds some spacing

            Text(
              'Textbox:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
