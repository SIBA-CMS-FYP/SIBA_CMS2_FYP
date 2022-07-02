
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
 return Scaffold(

   appBar: AppBar(
         backgroundColor: Colors.blue,
         title: Text("Profile"),
        leading: IconButton(
          onPressed: (){
          Navigator.pop(context);
        },
         icon: Icon(
          Icons.arrow_back_ios,

        ),
        ),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 18.0, right: 50.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: new AssetImage("assets/images/profile.jpg"),
                           fit: BoxFit.cover
                      )
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
          
        ),

        
      ),
      
    );
  }
}