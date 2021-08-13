import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result='no data fount';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Text'),
        centerTitle:true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(onPressed: (){
                futureTest();
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Future test',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                result,
                style: TextStyle(fontSize: 20.0,
                  color: Colors.red),
              ),
              Divider(
                height: 20.0,
                thickness: 2.0,
              ),
              FutureBuilder(
                future: myFuture(),
                builder: (context, snapshot){
                  if(snapshot.connectionState==ConnectionState.done){
                    return Text(
                      snapshot.data,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                })
            ],
          ),
        ),
      ),
    );
  }
  Future<void> futureTest() async{
  await Future.delayed(Duration(seconds: 3)).then((value){
    print('Here comes second');
    setState((){
      this.result='The data is fetched';
      print(result);
    });
  });
  print('Here comes first');
  }

  Future<String> myFuture() async{
    await Future.delayed(Duration(seconds: 2));
    return 'another future completed';
  }
}

