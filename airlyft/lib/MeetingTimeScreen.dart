import 'package:flutter/material.dart';

class MeetingTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Where/when should we meet?"),
        ),
        body: Column(
          children: <Widget>[
            Text(
              "Which terminal is your flight?",
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Terminal 2",
              ),
            ),
            Text(
              "What's the door closest to you?",
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Door 8",
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MeetingTimeScreen()));
              },
              child: Text('Next'),
            )
          ],
        ));
  }
}
