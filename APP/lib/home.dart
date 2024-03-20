import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State <home> createState() =>  homeState();
}

class  homeState extends State <home>{
  String url ="";
  String  Output ="Null";
  var data;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Simple")),
      body:Center(
        child:Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            TextField(
              onChanged: (value){
                url ="http://10.0.2.2:5000/api?query="+value.toString();            },
            ),
            TextButton(onPressed: ()async{
                data= await get(Uri.parse(url));


                var decode = jsonDecode(data);
                setState(() {
                  Output =data["output"].toString();
                });
            }, child: Text("Fetch",style:TextStyle(fontSize: 40,color:Colors.green),
            )),
            Text(Output)
          ]),
        )
        ),
    );
  }
}