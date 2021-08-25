import 'package:flutter/material.dart';
import 'package:weather/model/model.dart';


class clothes extends StatefulWidget {
  clothes({this.parsetempData, this.parseindexData});
  final dynamic parsetempData;
  final dynamic parseindexData;

  @override
  _clothesState createState() => _clothesState();
}

class _clothesState extends State<clothes> {
  Widget? cloth;
  Widget? mask;
  Model model = Model();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cloth=update(widget.parsetempData);
    mask = model.getmask(widget.parseindexData);
  }

  Widget? update(dynamic tempData){
     if (tempData >= 28) {
      return Text(
        '민소매, 반팔, 반바지, 린넨옷',
        style: TextStyle(color: Colors.blueAccent, fontSize: 16.0,fontWeight: FontWeight.bold,),
      );
    } else if (tempData <= 27 && tempData >= 23) {
      return Text(
        '반팔, 얇은셔츠, 반바지, 면바지',
        style: TextStyle(color: Colors.blueAccent, fontSize: 16.0,fontWeight: FontWeight.bold,),
      );
    } else if (tempData <= 22 && tempData >= 20) {
      return Text(
        '블라우스, 긴팔 티, 면바지, 슬랙스',
        style: TextStyle(color: Colors.blueAccent, fontSize: 16.0,fontWeight: FontWeight.bold,),
      );
    } else if (tempData <= 19 && tempData >= 17) {
      return Text(
        '얇은가디건이나 니트, 맨투맨, 후드, 긴바지',
        style: TextStyle(color: Colors.blueAccent, fontSize: 16.0,fontWeight: FontWeight.bold,),
      );
    } else if (tempData <= 16 && tempData >= 12) {
      return Text(
        '자켓, 가디건, 청자켓, 니트, 청바지',
        style: TextStyle(color: Colors.blueAccent, fontSize: 16.0,fontWeight: FontWeight.bold,),
      );
    } else if (tempData <= 11 && tempData >= 9) {
      return Text(
        '트렌치코트, 야상, 점퍼, 기모바지',
        style: TextStyle(color: Colors.blueAccent, fontSize: 16.0,fontWeight: FontWeight.bold,),
      );
    } else if (tempData <= 8 && tempData >= 5) {
      return Text(
        '울 코드, 히트텍, 가죽 옷, 기모',
        style: TextStyle(color: Colors.blueAccent, fontSize: 16.0,fontWeight: FontWeight.bold,),
      );
    } else if (tempData <= 4) {
      return Text(
        '패딩, 두꺼운코트, 누빔옷, 기모, 목도리',
        style: TextStyle(color: Colors.blueAccent, fontSize: 16.0,fontWeight: FontWeight.bold,),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('복장과 준비물'),
        backgroundColor: Colors.blueGrey, //색상이 사라짐, 회색
        elevation: 0.0, //음영 없애기
        leading: IconButton(
          icon: Icon(Icons.umbrella),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.masks_outlined),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('기온에 맞는 옷차림',
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 20.0,
          ),
          ),
          SizedBox(
            height: 30,
          ),
          cloth!,
          SizedBox(
            height: 50,
          ),
           Text('미세먼지 농도에따른 마스크여부',
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 20.0,
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
              icon: Icon(Icons.masks),
              onPressed: () {},
              iconSize: 30.0,
              ),
              mask!
            ],
          ),
        ],
      )

    );
  }
}