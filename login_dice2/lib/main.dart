import 'package:flutter/material.dart';
// import android.support.annotation.NonNull;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView( //키보드로 텍스트영역 침범한다고 에러나서 스크린이 스크롤 될수있게 함. column위젯을 감싸준거임 ㅋㅋ
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
            Center(
              child: Image(
                image: AssetImage('image/chef.gif'),
                width: 170.0,
                height: 190.0,
              ),
            ),
            Form( //정보 입력받는 화면 구현할때 사용됨
                child: Theme(
                    data: ThemeData( //테마를 지정한거
                        primaryColor: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme( //텍스트필드 클릭했을때 밑줄 강조 효과
                            labelStyle:
                                TextStyle(color: Colors.teal, fontSize: 15.0))),
                    child: Container( //본격적으로 정보를 입력할 텍스트필드를 구현해보자
                      padding: EdgeInsets.all(40.0), //사방으로 간격 띄우기
                      child: Column(
                        children: [
                          TextField(
                            decoration: //텍스트필드의 레이블을 써주기위해
                                InputDecoration(labelText: 'Enter dice'), 
                            keyboardType: TextInputType.emailAddress, //키보드 타입 지정
                          ),
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Enter password'),
                            keyboardType: TextInputType.text,
                            obscureText: true, //패스워드 문자가 표시되지 않게함
                          ),
                          SizedBox(height: 40.0,),
                          ButtonTheme( //편하게 버튼의 크기등을 설정할수있다
                            minWidth: 100.0,
                            height: 50.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent
                                ),
                                child:Icon( //아이콘모양의 버튼인거지
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                                onPressed: (){}
                              )
                          ),
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
