import 'package:flutter/material.dart';
import 'package:refactoring/photo_card.dart';
import 'package:refactoring/pj_button.dart';
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

  ///todo:Пояснения
  ///Вся отрисовка во флаттере происходит через одну функцияю build,
  ///однако сами виджеты отрисовки являются отдельными классами


  ///В данном классе можно заметить дублирование кода и большой класс(по меркам флаттера)
  ///Поэтому были применен метод Extract Class.
  ///
  /// Также код очищен от бесполезных комментариев
  ///
  /// Функция Get_TITLEcontainer мало того, что не соотвествует неймингу Flutter(lowerCammelCase), так и не несет в себе никакой сути
  /// Как и переменные a, b, title, another_title всех их можно уничтожить

  @override
  Widget build(BuildContext context) {
    return Scaffold(//Формирование базвого шаблона
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(//Основная колонка с содержимым экрана
          children: [
            Row(//Строка с информацией о себе
              children: [
                ClipRRect(//Аватар
                  borderRadius: BorderRadius.circular(300),
                  child: Image.network(
                    'https://bipbap.ru/wp-content/uploads/2021/07/1551512888_2-730x617.jpg',//Ссылка на аватар
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(//Информация о пользователе
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Енот Валерий',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Обо мне'.toUpperCase(),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),//Стили заголовка
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 600,
                          child: Text(
                            'Я крутой енот Инокентий, проживающий на территории воображаемой страны ',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
              child: Row(//Фотографии пользователя
                mainAxisSize: MainAxisSize.min,
                children: [
                  PhotoCard(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwsx3qY47xpk0Bx98j3fbTURp7ZPzzI3x6Ky9IF7n3eHywERE-UC5tjf9ccJHOvw-rDjA&usqp=CAU'),
                  SizedBox(
                    width: 10,
                  ),
                  PhotoCard(image: 'https://vot-enot.com/wp-content/uploads/2021/12/scale_1200-e1649948122460.jpg'),
                  SizedBox(
                    width: 10,
                  ),
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
                PjButton(title: 'Подписаться', onTap: (){}),
                SizedBox(
                  width: 20,
                ),
                PjButton(title: 'Написать', onTap: (){}),
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
}
