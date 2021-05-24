import 'package:codibex_blogs/mainLogin.dart';
import 'package:codibex_blogs/password.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5.0),
              ),
              
              width: double.maxFinite,
              height: 50,
              margin: EdgeInsets.only(
                left: 25,
                right: 25,
                top: 60
              ),
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Password()
                    ),
                  );
                  
                }, child: Text("Create New Account")
                ),
            ), 
            Container(
              margin: EdgeInsets.only(
                top: 20
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mainLogin()
                    ),
                  );
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.blue
                  )
                )
              )
            )    
          ]
        )
      )
      
    );
  }
}


