import 'package:flutter/material.dart';
import 'package:refactoring/photo_card.dart';
import 'package:refactoring/user_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Labs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String a = 'Поделиться'; //Переменная содержащяя текст Поделиться
  String b = 'Написать';//Переменная содержащяя текст Написать
  String title = ''; //Оглавление
  bool another_title = false;//Параметр изменения текста кнопки


  //Функция отрисовки экрана
  @override
  Widget build(BuildContext context) {
    return Scaffold(//Формирование базвого шаблона
      appBar: AppBar(//Заголовок приложения
        title: Text(widget.title),//Оглавление заголовка
      ),
      body: Padding(//Отступ по бокам экрана
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(//Основная колонка с содержимым экрана
          children: [
            Row(//Строка с информацией о себе
              children: [
                ClipRRect(//Аватар
                  borderRadius: BorderRadius.circular(300),
                  child: Image.network(
                    'https://bipbap.ru/wp-content/uploads/2021/07/1551512888_2-730x617.jpg',//Ссылка на аватар
                    height: 100,//Размер аватара 1
                    width: 100,//Размер аватара 2
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Padding(// Отступ для контента о себе
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Енот Валерий',//Имя пользователя
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Обо мне'.toUpperCase(),//Заголовок о себе
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),//Стили заголовка
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 600,
                          child: Text(
                            'Я крутой енот Инокентий, проживающий на территории воображаемой страны ',//Описание пользователя
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),//Стили описания
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(child: UserInfo()),//Информация о подписчиках и подписках
            SizedBox(height: 30,),
            //Блок с фото
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Фото 1
                  PhotoCard(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwsx3qY47xpk0Bx98j3fbTURp7ZPzzI3x6Ky9IF7n3eHywERE-UC5tjf9ccJHOvw-rDjA&usqp=CAU'),
                  SizedBox(
                    width: 10,
                  ),
                  //Фото 2
                  PhotoCard(image: 'https://vot-enot.com/wp-content/uploads/2021/12/scale_1200-e1649948122460.jpg'),
                  SizedBox(
                    width: 10,
                  ),
                  //Фото 3
                  PhotoCard(
                      image:
                          'https://static.mk.ru/upload/entities/2015/08/10/articles/detailPicture/6e/0c/65/829952131_3022582.jpg'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            //Строка с кнопками
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Кнопка 1
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                    child: Center(
                      child: Text(
                        Get_TITLEcontainer(a, b, another_title),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                //Кнопка 2
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                    child: Center(
                      child: Text(
                        Get_TITLEcontainer(a, b, !another_title),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///Функция для получения заголовка кнопки ррр
  String Get_TITLEcontainer(String a, String b, bool mode) {
    String title;
    if (mode) {
      title = a;
    } else {
      title = b;
    }
    return title;
  }
}
