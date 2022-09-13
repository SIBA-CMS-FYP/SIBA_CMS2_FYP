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
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("How much This application Help students"),
          TextField(
            decoration: InputDecoration(hintText: "Ans"),
          ),
          Text("Is this Application Easy to use"),
          TextField(
            decoration: InputDecoration(hintText: "Ans"),
          ),
          Text("Rate this App"),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            width: 300,
            child: TextField(
              controller: feedbackmsg,
              decoration: const InputDecoration(
                labelText: 'Give Your Feedback',
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
