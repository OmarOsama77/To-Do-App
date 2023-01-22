import 'dart:ffi';

import 'package:flutter/material.dart';

class first extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return firstState();
  }
}

class firstState extends State<first> {
  TextEditingController name = new TextEditingController();
  var tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 80),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "The tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "you have ${tasks.length} tasks",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration:BoxDecoration(
                    color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(25))
                  ) ,
                  child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${tasks[index]}"),
                          trailing: IconButton(icon : Icon(Icons.delete),onPressed: (){
                            setState(
                                (){
                                  tasks.removeAt(index);
                                }
                            );
                          }),
                        );
                      })),
            )
          ],
        ),
      ),
     floatingActionButton: new FloatingActionButton(
       onPressed: (){
         showModalBottomSheet(
           isScrollControlled: true,
             context: context,
             builder: (context)=>
                 SingleChildScrollView(
                   child: Container(alignment: Alignment.center,width: double.infinity,
                     padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                     child: Container(width: double.infinity,
               padding: EdgeInsets.all(30),
               child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text("Add task",style: TextStyle(fontSize: 30,color: Colors.indigo,fontWeight: FontWeight.bold),),
                       TextField(
                         controller: name,
                          autofocus: true,
                         textAlign: TextAlign.center,
                       decoration: InputDecoration(
                         labelText: "Enter"
                       ),
                       ),SizedBox(height: 20,),
                       TextButton(
                           onPressed: (){
                             tasks.add(name.text);
                             print(name);
                             setState(() {
                               ListView.builder(
                                   itemCount: tasks.length,
                                   itemBuilder: (context, index) {
                                     return ListTile(
                                       title: Text("${tasks[index]}"),
                                     );
                                   });
                             });
                           },
                           child:
                            Text("Add"),
                         style: TextButton.styleFrom(backgroundColor: Colors.teal[400],primary: Colors.white),
                       )
                     ],
               ),
             ),
                   ),
                 ));
       },
       child: Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
