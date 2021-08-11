import 'package:flutter/material.dart';
import 'dice.dart';
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
  TextEditingController controller = TextEditingController(); //텍스트필드 데이터 읽기위해
  TextEditingController controller2 = TextEditingController();
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
      body: GestureDetector( //시용자의 행동을 감지하는 위젯
        onTap: (){ //화면의 빈공간 터치하면 키보드 사라지게 하기위해..
          FocusScope.of(context).unfocus();//focusscope는 어떤 위젯들까지 포커스를 받는지 범위를 나타냄
        }, 
        child: SingleChildScrollView(
          //키보드로 텍스트영역 침범한다고 에러나서 스크린이 스크롤 될수있게 함. column위젯을 감싸준거임 ㅋㅋ
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
              Form(
                  //정보 입력받는 화면 구현할때 사용됨
                  child: Theme(
                      data: ThemeData(
                          //테마를 지정한거
                          primaryColor: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                              //텍스트필드 클릭했을때 밑줄 강조 효과
                              labelStyle:
                                  TextStyle(color: Colors.teal, fontSize: 15.0))),
                      child: Container(
                        //본격적으로 정보를 입력할 텍스트필드를 구현해보자
                        padding: EdgeInsets.all(40.0), //사방으로 간격 띄우기
                        child: Column(
                          children: [
                            TextField(
                              // autofocus: true, //자동포커스, 자동으로 키보드 올라옴
                              
                              controller: controller,
                              decoration: //텍스트필드의 레이블을 써주기위해
                                  InputDecoration(labelText: 'Enter dice'),
                              keyboardType:
                                  TextInputType.emailAddress, //키보드 타입 지정
                            ),
                            TextField(
                              controller: controller2,
                              decoration:
                                  InputDecoration(labelText: 'Enter password'),
                              keyboardType: TextInputType.text,
                              obscureText: true, //패스워드 문자가 표시되지 않게함
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            ButtonTheme(
                                //편하게 버튼의 크기등을 설정할수있다
                                minWidth: 100.0,
                                height: 50.0,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orangeAccent),
                                    child: Icon(
                                      //아이콘모양의 버튼인거지
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 35.0,
                                    ),
                                    onPressed: () {
                                      if (controller.text == 'dice' &&
                                          controller2.text == '1234') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    Dice()));
                                      } else if (controller.text == 'dice' &&
                                          controller2.text != '1234') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('비밀번호가 잘못됨'),
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.redAccent,
                                        ));
                                      } else if (controller.text != 'dice' &&
                                          controller2.text == '1234') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('dice철자가 잘못됨'),
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.redAccent,
                                        ));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('로그인 정보 틀림'),
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.redAccent,
                                        ));
                                      }
                                    })),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

// void showSnackBar(BuildContext context){
//   Scaffold.of(context).showSnackBar(
//     SnackBar(content: 
//       Text('로그인 정보들 다시 확인하세요',
//       textAlign:TextAlign.center,),
//       duration: Duration(seconds: 2),
//       backgroundColor: Colors.blue,
//     ),
//   );
// }

// void showSnackBar2(BuildContext context){
//   Scaffold.of(context).showSnackBar(
//     SnackBar(content: 
//       Text('비밀번호가 일치하지 않습니다',
//       textAlign:TextAlign.center,),
//       duration: Duration(seconds: 2),
//       backgroundColor: Colors.blue,
//     ),
//   );
// }

// void showSnackBar3(BuildContext context){
//   Scaffold.of(context).showSnackBar(
//     SnackBar(content: 
//       Text('다이스의 철자를 확인하세요',
//       textAlign:TextAlign.center,),
//       duration: Duration(seconds: 2),
//       backgroundColor: Colors.blue,
//     ),
//   );
// }