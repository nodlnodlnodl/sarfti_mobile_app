import 'dart:convert';
import 'package:flutter_application_1/model/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/read_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

// Виджет вывода новостей
class NewsPage extends StatefulWidget {
  const NewsPage({super.key});
  _NewsPage createState() => _NewsPage();
}

class _NewsPage extends State<StatefulWidget> {


  List<newsParser> listOfNews = [];
  _getNewsList() async {
    var request = await http.get(Uri.parse("http://127.0.0.1:8000/getNews"));
    debugPrint(request.body.toString());
    List<dynamic> listNews = jsonDecode(request.body.toString());
  }
  @override
  _launchURL(String urlSet) async {
    String url;
    url = urlSet;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Невозможно открыть $url';
    }
  }

  Widget build(BuildContext context) {
    List _newsTitle = [
      "Победы команд СарФТИ в турнире по волейболу",
      "Коллектив СарФТИ НИЯУ МИФИ с Днем Победы поздравляет руководитель вуза А.Г. Сироткина",
      "С Днем Победы, друзья!",
      "Мы уже вступили в эпоху информационного взрыва. Запрещать нейросети бессмысленно, регулировать необходимо",
      "ХК «СарФТИ» — серебряный призёр Чемпионата Нижегородской области по хоккею среди студенческих команд сезона 2022/23!",
    ];
    List _newsText = [
      "9 мая в Сарове на стадионе «Икар» легкоатлеты СарФТИ НИЯУ МИФИ приняли участие в традиционной городской легкоатлетической эстафете, посвященной Дню Победы и 78-й годовщине Победы в Великой Отечественной войне 1941-1045 гг. Впервые эстафета состоялась в нашем городе в 1949 году.",
      "Члены волейбольного клуба СарФТИ НИЯУ МИФИ 1 мая приняли участие в турнире по волейболу, посвящённом празднику Весны и Труда. Турнир состоялся в г. Первомайске Нижегородской области. В результате серьезной борьбы женская сборная СарФТИ НИЯУ МИФИ вышла на I место и стала победителем турнира, мужская сборная вуза заняла II место.",
      "Запрещать нейросети бессмысленно, научиться с ними работать – необходимо. Мы уже вступили в эпоху информационного взрыва. Все устройства, окружающие нас, становятся умными – телефон, чайник, часы, холодильник. И нам необходим интеллектуальный помощник, который справится с обработкой мощного потока информации. Конечно, есть риск, что ИИ превратится в костыль, без которого человеку будет трудно ходить. Возможно, если нейросеть постоянно будет подавать нам нужную информацию на блюдечке, пострадают наши аналитические способности. Поэтому было бы правильно создать документ, регулирующий применение ИИ. Так, с появлением автомобилей стали необходимы правила дорожного движения, – считает Валентин Климов, руководитель Института интеллектуальных кибернетических систем (ИИКС) НИЯУ МИФИ, кандидат технических наук, эксперт по искусственному интеллекту.",
      "",
      "",
      "Команда Хоккейного клуба Саровского физико-технического института (СарФТИ) НИЯУ МИФИ стала серебряным призером Чемпионата Нижегородской области по хоккею среди студенческих команд сезона 2022/23."
    ];
    List _newsUrl = [
      "https://sarfti.ru/?p=29182",
      "https://sarfti.ru/?p=29169",
      "https://sarfti.ru/?p=29155",
      "https://sarfti.ru/?p=29146",
      "https://sarfti.ru/?p=29140",
      "https://sarfti.ru/?p=29117"
    ];
    List _newsUrlImg = [
      "https://sarfti.ru/wp-content/uploads/2023/05/1-5-300x250.jpg",
      "https://sarfti.ru/wp-content/uploads/2023/05/1-4-300x225.jpg",
      "https://sarfti.ru/wp-content/uploads/2023/05/9-Мая-2023г-Сироткина-scaled.jpg",
      "https://sarfti.ru/wp-content/uploads/2023/05/1-3-150x150.jpg",
      "https://sarfti.ru/wp-content/uploads/2023/04/Vlasov146.jpg",
      ""
    ];
    List _newsDate = [
      "2023-05-10",
      "2023-05-10",
      "2023-05-04",
      "2023-05-04",
      "2023-05-04",
      "2023-05-04"
    ];
    return Scaffold(
      body: ListView.builder(
          padding:
              EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
          scrollDirection: Axis.vertical,
          itemCount: _newsTitle.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${_newsTitle[index]}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if ('${_newsText[index]}' != "")
                      Text(
                        '${_newsText[index]}',
                        style: TextStyle(fontSize: 16),
                      ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if ('${_newsUrlImg[index]}' != "")
                      Image.network('${_newsUrlImg[index]}'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${_newsDate[index]}'),
                        FloatingActionButton.extended(
                          heroTag: null,
                          onPressed: () {
                            _launchURL('${_newsUrl[index]}');
                          },
                          label: Text("Читать"),
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
