// import 'dart:js';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyButtons(),
    );
  }
}

class MyButtons extends StatelessWidget {
  const MyButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('button'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){
                print('click');
              },
              onLongPress: (){
                print('long click');
              },
              child: Text('Text Button',
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.redAccent,
                // backgroundColor: Colors.orange
              ),
            ),
            ElevatedButton(
              onPressed:(){
              print('elevation button');
              },
              child: Text('Elevated button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                elevation: 0.0
              ),
            ),
            OutlinedButton(
              onPressed: (){
                print('online button');
              }, 
              child: Text('outline button'),
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                side: BorderSide(
                  color:Colors.black,
                  width: 2.0)
              ),
            ),
            TextButton.icon(
              onPressed: (){
                print('icon button');
              }, 
              icon: Icon(
                Icons.home,
                size: 30.0,
                color: Colors.pink,
              ),
              label: Text('go to home'),
              style: TextButton.styleFrom(
                primary: Colors.purple
              ),
            ),
             ElevatedButton.icon(
              onPressed: (){
                print('icon button');
              }, 
              icon: Icon(
                Icons.home,
                size: 20.0,
                
              ),
              label: Text('go to home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: Size(200,50),
              ),
            ),
             OutlinedButton.icon(
              onPressed: (){
                print('icon button');
              }, 
              icon: Icon(
                Icons.home,               
              ),
              label: Text('go to home'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black
              ),
            ),
            ElevatedButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.home,
                size: 20.0,
                
              ),
              label: Text('go to home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onSurface: Colors.pink
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.all(20),
              children: [
                TextButton(onPressed: (){},
                  child: Text('Text Button'),
                ),
                ElevatedButton(onPressed: (){},
                  child: Text('Elevated Button'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
