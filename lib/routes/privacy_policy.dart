import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final TextEditingController feedbackmsg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 200,
            child: TextField(
              controller: feedbackmsg,
              decoration: const InputDecoration(
                labelText: 'Enter Your Feedback',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.blueAccent),
                ),
              ),
              keyboardType: TextInputType.multiline,
              expands: true,
              maxLength: 5000,

              // minLines: 1, // <-- SEE HERE
              maxLines: null, // <-- SEE HERE
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text("Send Feedback"),
          ),
        ]),
      ),
    );
  }
}
