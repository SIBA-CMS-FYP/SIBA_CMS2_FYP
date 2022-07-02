import 'package:flutter/material.dart';

class SendFeedbackPage extends StatefulWidget {
  @override
  _SendFeedbackPageState createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Feedback'),
            Padding(padding: const EdgeInsets.all(10.0),
            child: TextFormField(
    textInputAction: TextInputAction.newline,
    keyboardType: TextInputType.multiline,
    maxLines: 10,
    minLines: 1,
    decoration: InputDecoration(
      hintText: "please enter feedback",
      hintStyle: TextStyle(
        color: Colors.grey
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
        )
    ),
            ),
            ),
            ElevatedButton(onPressed: (){}, child: Text('send feedback'))
          ],
        )

        
         ),
    );
  }
}
