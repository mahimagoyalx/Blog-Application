import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codibex_blogs/blogs.dart';

class Profile extends StatelessWidget {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  
  String emailAddress;
  Profile(this.emailAddress);

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
              "Enter your details",
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
                controller: fullNameController,
                cursorWidth: 0.7,
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Full Name',
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
                controller: phoneController,
                cursorWidth: 0.7,
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Phone Number',
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
                controller: ageController,
                cursorWidth: 0.7,
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Age',
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
                controller: cityController,
                cursorWidth: 0.7,
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'City',
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
                    var dataObject = {
                   "fullName": fullNameController.text,
                   "phone": phoneController.text,
                   "age": ageController.text,
                   "city": cityController.text,
                   "email": emailAddress
                  };
                   await Firestore().collection("Users").document(emailAddress).setData(dataObject);   
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Blog()
                    ),
                  );      
                }, 
                child: Text("Submit")
                ),
             )
          
          
        ],
        )
      
    );
  }
}