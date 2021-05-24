
import 'package:codibex_blogs/profile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Password extends StatelessWidget {
  
  FocusNode myFocusNode = new FocusNode();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
            ),
            alignment: Alignment.center,
            child: Text(
              "Enter Email Address & Password",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20
              )
            ),
          ),
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
                hintText: 'Email Address',
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
                obscureText: true,
                controller: passwordController,
                cursorWidth: 0.7,
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
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
                 
              ),
              height: 62,
              padding: EdgeInsets.only(
                
                top:20
              ),
              
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async {
                  try{
                    var authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text, 
                    password: passwordController.text
                  );
                  print("Cleared");
                  //Second: Check if authentication successful
                  if (authResult.user != null) {
                    //Sign up was successful!
                    //Third: Storing data in Firestore
                    // Firestore().collection("Users").document(emailController.text).setData(
                    //   {
                    //     "email": emailController.text,
                        
                    //   }
                    // );
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile(emailController.text)),
                  );
                   
                  } else {
                    //Sign Up unsuccessful!
                    print("Unsuccessful!");
                  }
                  } catch(e){
                    print("Catch");
                  print(e);
                    
                  }
                     
                }, 
                child: Text("Next")
                ),
             )
        ]
        
      )
      
    );
  }
}