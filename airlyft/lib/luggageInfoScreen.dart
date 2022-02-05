import 'package:airlyft/meetingTimeScreen.dart';
import 'package:flutter/material.dart';

class LuggageInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("More Luggage Information"),
        ),
        body: Column(
          children: <Widget>[
            Text(
              "How many luggages do you have?",
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "2",
              ),
            ),
            Text(
              "What's the total weight of your luggage (lbs)?",
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "100",
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
