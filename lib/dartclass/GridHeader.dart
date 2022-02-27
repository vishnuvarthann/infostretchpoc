import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class GridHeader extends StatefulWidget {
  @override
  _GridHeaderState createState() => _GridHeaderState();
}

class _GridHeaderState extends State<GridHeader> {

  List<String> listHeader = ['Ped Animals','Ped foods','Ped Needs',];
  List<String> listTitle = ['Canary ','Persian Cat','Siamese Fighting Fish','Hedgehog','Rabbits'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Ped-Fed"),
      ),
      body: gridHeader(),
    );
  }


  Widget gridHeader(){
    return ListView.builder(itemCount: listHeader.length,itemBuilder: (context, index) {
      return StickyHeader(
        header:Container(
          height: 38.0,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.centerLeft,
          child: Text(listHeader[index],
            style: const TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
          ),
        ),
  
        content: Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const  NeverScrollableScrollPhysics(),
            itemCount: listTitle.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,),
            itemBuilder: (contxt, indx){
              return Card(
                margin: const EdgeInsets.all(14.0),
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 6.0, bottom: 2.0),
                  child: Center(child: Text(listTitle[indx], 
                  style: const TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),)),
                ),
              );
            },
          ),
        ),
      );
    },
      shrinkWrap: true,
    );
  }
}