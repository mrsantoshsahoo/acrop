
import 'package:flutter/material.dart';

class Entertainment extends StatelessWidget {
  List mydata=[
    "Hindi Music",
    "English Music",
    "Ordia Muisic",
    "Telugu Music",
    "Other Music"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: mydata.length,
            itemBuilder: (context,index){
            return Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.music_note,color: Colors.blue,),
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
          })
        ],
      )
    );
  }
}