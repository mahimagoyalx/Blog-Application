import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {

  void initState() {
    getData();
    super.initState();
  }

  var blogs = [];

  void getData() async {
    try {
      var dataList = [];
      var collection = await Firestore().collection("Blogs").getDocuments();
      for (var doc in collection.documents) {
        dataList.add(doc.data);
      }
      setState(() {
        blogs = dataList;
      });

    } catch(e) {
       print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        
        title: Text(
          "Blogs"
        ),
        
      ),
      body: Container(
        width: double.maxFinite,
        child: Column(
          children: <Widget>[
           
            Expanded(
              child: ListView.builder(
                itemCount: blogs.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: 14,
                      left: 10,
                      right: 10,
                      bottom: 3
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(15),

                    ),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Image.network(
                            blogs[index]["imageURL"]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 10
                          ),
                          child: Text(
                            blogs[index]["title"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 5
                          ),
                          child: Text(
                            blogs[index]["description"],
                            style: TextStyle(
                              color: Color(0XFF606060)
                            ),
                          )
                        )
                      ],
                    )
                  );
                }
                
              )
            )

          ],
        )
      )
      
    );
  }
}