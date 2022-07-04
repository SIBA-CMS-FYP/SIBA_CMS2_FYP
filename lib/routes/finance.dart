import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Finance Information '),
            Padding(padding: const EdgeInsets.all(10.0),
            child: TextFormField(
    textInputAction: TextInputAction.newline,
    keyboardType: TextInputType.multiline,
    maxLines: 10,
    minLines: 1,
    decoration: InputDecoration(
     labelText: "Fees Remaining",
     icon: Icon(Icons.money),
      hintText: "0.00",
      hintStyle: TextStyle(
        color: Colors.grey
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
        )
    ),
            ),
            ),
            ElevatedButton(onPressed: (){}, child: Text('Apply for no Dues'))
          ],
        )

        
         ),

    );
  }
}
