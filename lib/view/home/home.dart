import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List mydata = ["Banking App", "Travel App", "Booking App", "Todo App"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: mydata.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.app_registration_sharp,
                          color: Colors.black,
                        ),
                        title: Text(mydata[index]),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.orange,
                            )
                            ),
                      ),
                    ],
                  ),
                );
              }),
          // Text("Welcome! "+_email!,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          FlatButton(
              color: Colors.cyan,
              onPressed: () {
                showDialogWithFields(context);
              },
              child:
                  Text("Give Feedback", style: TextStyle(color: Colors.white)))
        ],
      )),
    );
  }

  void showDialogWithFields(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        var emailController = TextEditingController();
        var messageController = TextEditingController();
        return AlertDialog(
          title: Text('Send Feedback'),
          content: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Enter Your Message'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Send them to your email maybe?
                var email = emailController.text;
                var message = messageController.text;
                Navigator.pop(context);
              },
              child: Text('Send'),
            ),
          ],
        );
      },
    );
  }
}
