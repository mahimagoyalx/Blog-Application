import 'package:codibex_blogs/blogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class mainLogin extends StatefulWidget {

  @override
  _mainLoginState createState() => _mainLoginState();
}

class _mainLoginState extends State<mainLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible;

  FocusNode myFocusNode = new FocusNode();

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
                 color: Colors.grey[200],
              ),
              margin: EdgeInsets.only(
                top: 25,
                left: 20,
                right: 20
              ),
              
              
              child: TextFormField(
                
                controller: emailController,
                cursorWidth: 0.7,
                cursorColor: Colors.grey[700],
                
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Phone number, email or username',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15
                ),
                contentPadding: EdgeInsets.only(
                  left: 15
                )
                ),
                style: TextStyle(color: Colors.black)
              )
            ),
            Container(
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5.0),
                 color: Colors.grey[200],
              ),
              
              
              margin: EdgeInsets.only(
                top: 15,
                left: 20,
                right: 20
              ),
              
              child: TextFormField(
                
                controller: passwordController,
                obscureText: true,
                cursorWidth: 0.7,
                cursorColor: Colors.grey[700],
                
                decoration: InputDecoration(
                
                border: InputBorder.none, 
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  
                  
                ),
                
                
                  
                
                contentPadding: EdgeInsets.only(
                  left: 15
                  


                ),
                
                ),
            

                style: TextStyle(color: Colors.black),
                
              )
            ),
            Container(
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5.0),
                 
              ),
              height: 62,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top:20
              ),
              
              child: FlatButton(
                
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async {
                  try{
                    var authResult= await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text, 
                    password: passwordController.text
                    );
                    if(authResult.user != null){
                    //  print("Sign In Successful!");
                      Navigator.push(
                        context,
                         MaterialPageRoute(builder: (context) => Blog()),
                  );
                    } else{
                     print("Sign In Unsuccessful!");
                    }
                  } catch(e){
                    print(e);
                  }
                    
                }, child: Text("Log In")
                ),
            )
            
          ]
        )
      )

      
    );
  }
}