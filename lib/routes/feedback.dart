import 'package:flutter/material.dart';
// import 'package:reviews_slider/reviews_slider.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBacktate createState() => _FeedBacktate();
}

class _FeedBacktate extends State<FeedBack> {
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

// class FeedBack extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<FeedBack> {
//   late int selectedValue1;
//   late int selectedValue2;

//   void onChange1(int value) {
//     setState(() {
//       selectedValue1 = value;
//     });
//   }

//   void onChange2(int value) {
//     setState(() {
//       selectedValue2 = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'How was the help you received?',
//                 style: TextStyle(color: Color(0xFF6f7478), fontSize: 18),
//               ),
//               SizedBox(height: 20),
//               ReviewSlider(
//                 onChange: onChange1,
//               ),
//               Text(selectedValue1.toString()),
//               SizedBox(height: 20),
//               Text(
//                 '¿Cómo fue la ayuda que recibiste?',
//                 style: TextStyle(color: Color(0xFF6f7478), fontSize: 18),
//               ),
//               SizedBox(height: 20),
//               ReviewSlider(
//                   optionStyle: TextStyle(
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   onChange: onChange2,
//                   initialValue: 1,
//                   options: ['Terrible', 'Malo', 'Bien', 'Vale', 'Genial']),
//               Text(selectedValue2.toString()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
