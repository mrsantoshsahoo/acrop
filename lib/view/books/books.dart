import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  List mydata = ["C++ (2020) Books", "Flutter 2.2 Books", "Dart Books"];
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      leading: Icon(Icons.book_online,color: Colors.green,),
                      title: Text(mydata[index]),
                       trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.orange,
                            ))
                    ),
                  ],
                ),
              );
            }),
      ],
    ));
  }
}
