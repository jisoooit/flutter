import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/model.dart';
import 'package:weather/screens/clothscreen.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData, this.parseAirData});
  final dynamic parseWeatherData;
  final dynamic parseAirData;
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? city;
  int? temp;
  int? index;
  Widget? icon;
  String? des;
  Widget? airIcon;
  Widget? airState;
  Widget? cloth;
  Widget? mask;
  double? dust1;
  double? dust2;
  Model model = Model();
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirData);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    int condition = weatherData['weather'][0]['id'];
    des = weatherData['weather'][0]['description'];
    index = airData['list'][0]['main']['aqi'];
    dust1 = airData['list'][0]['components']['pm10'].toDouble();
    dust2 = airData['list'][0]['components']['pm2_5'].toDouble();

    double temp2 = weatherData['main']['temp'].toDouble();
    temp = temp2.toInt(); //round() 반올림 해도 됨 ㅋ
    city = weatherData['name'];
    icon = model.getWeatherIcon(condition);
    airIcon = model.getAirIcon(index!);
    airState = model.getAirCondition(index!);
    cloth = getcloth(temp!);
    mask = model.getmask(index!);
    print(temp);
    print(city);
  }

  Widget? getcloth(int temp) {
    if (temp >= 28) {
      return Text(
        '민소매, 반팔, 반바지, 린넨옷',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    } else if (temp <= 27 && temp >= 23) {
      return Text(
        '반팔, 얇은셔츠, 반바지, 면바지',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    } else if (temp <= 22 && temp >= 20) {
      return Text(
        '블라우스, 긴팔 티, 면바지, 슬랙스',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    } else if (temp <= 19 && temp >= 17) {
      return Text(
        '얇은가디건이나 니트, 맨투맨, 후드, 긴바지',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    } else if (temp <= 16 && temp >= 12) {
      return Text(
        '자켓, 가디건, 청자켓, 니트, 청바지',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    } else if (temp <= 11 && temp >= 9) {
      return Text(
        '트렌치코트, 야상, 점퍼, 기모바지',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    } else if (temp <= 8 && temp >= 5) {
      return Text(
        '울 코드, 히트텍, 가죽 옷, 기모',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    } else if (temp <= 4) {
      return Text(
        '패딩, 두꺼운코트, 누빔옷, 기모, 목도리',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      );
    }
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //바디를 앱바까지 확장
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent, //색상이 사라짐, 회색
        elevation: 0.0, //음영 없애기
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ), //지정한 영역을 꽉채우기 위해서
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    //확보할 수 있는 최대공간 확보
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.0,
                            ),
                            Text(
                              '$city',
                              style: GoogleFonts.lato(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  (Duration(minutes: 1)),
                                  builder: (context) {
                                    //빌더 위젯은 반드시 위젯을 리턴해줘야 한다.
                                    print('${getSystemTime()}');
                                    return Text(
                                      '${getSystemTime()}',
                                      style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  DateFormat('- EEEE, ').format(date),
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  DateFormat('d MMM, yyy').format(date),
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp°C',
                              style: GoogleFonts.lato(
                                fontSize: 85.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Row(children: [
                              icon!,
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '$des',
                                style: GoogleFonts.lato(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent),
                              child: Icon(
                                //아이콘모양의 버튼인거지
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              onPressed:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return clothes(
                                  parsetempData:temp,
                                  parseindexData:index
                                );
                              }));
                            },
                            ),
                           
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'aqi',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              airIcon!,
                              SizedBox(
                                height: 10.0,
                              ),
                              airState!,
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$dust1',
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'm3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$dust2',
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'm3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
