
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return Scaffold(
  appBar: AppBar(
         backgroundColor: Colors.lightBlue,
        title: Text('Profile'),
        leading: IconButton(
          onPressed: (){
          Navigator.pop(context);
        },
         icon: Icon(
          Icons.arrow_back_ios,

        ),
        ),
      ),
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.lightBlue, Colors.blueAccent]
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CircleAvatar(
                         backgroundImage: new AssetImage("assets/images/myphoto.jpg" ),
                         radius: 60.0,
                       ),
                      Text(
                        "Suraksha",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ), 
                     
                    ],
                  ),
                ),
              )
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            TextFormField(
    textInputAction: TextInputAction.newline,
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
      labelText: "Name",
     labelStyle: TextStyle(color: Colors.grey ),
     
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
        )
    ),
            ),
            SizedBox(
            height: 20.0,
          ),
             TextFormField(
    textInputAction: TextInputAction.newline,
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
      labelText: "Email",
     labelStyle: TextStyle(color: Colors.grey ),
     
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
        )
    ),
            ),

            SizedBox(
            height: 20.0,
          ),
             TextFormField(
    textInputAction: TextInputAction.newline,
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
      labelText: "Contact",
     labelStyle: TextStyle(color: Colors.grey ),
     
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
        )
    ),
            ),
                  
                ],
              ),
            ),
          ),
    
          
        ],
      ),
    );
  }
}