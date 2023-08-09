import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iskra/filters.dart';
import 'package:iskra/global.dart';

class Swipe extends StatefulWidget {
  const Swipe({super.key});

  @override
  State<Swipe> createState() => _SwipeState();
}

final controller = PageController(
  initialPage: 0,
);

ValueNotifier<int> activeBanner = ValueNotifier<int>(0);
bool isSelected = false;

List<String> photos = [
  "assets/banner-girl.png",
  "assets/banner-girl.png",
  "assets/banner-girl.png",
];

class _SwipeState extends State<Swipe> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 45,
          backgroundColor: white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: red,
              radius: 15,
              child: Image.asset(
                "assets/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Hero(
            tag: 'mainlogo',
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                height: 20,
                width: 108,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/icons/tune.png',
                  height: 20,
                  width: 20,
                ),
              ),
              // onTap: () {
              //   Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => FilterSwipe()));
              // }
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/icons/alarm.png',
                height: 20,
                width: 20,
              ),
            ),
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: h * 0.67,
                width: w,
                child: Stack(
                  children: [
                    PageView(
                        onPageChanged: (value) {
                          activeBanner.value = value;
                        },
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        controller: controller,
                        dragStartBehavior: DragStartBehavior.start,
                        children: [
                          for (var photo in photos)
                            Image.asset(
                              photo,
                              fit: BoxFit.cover,
                            ),
                        ]),
                    Positioned(
                      bottom: 20,
                      left: 50,
                      right: 50,
                      child: Container(
                        width: w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                  border: Border.all(
                                    width: 1,
                                    color: red,
                                  )),
                              child: Icon(
                                Icons.close,
                                color: red,
                                size: 30,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12.5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                  border: Border.all(
                                    width: 1,
                                    color: black,
                                  )),
                              child: Icon(
                                Icons.arrow_upward,
                                color: black,
                                size: 30,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12.5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                  border: Border.all(
                                    width: 1,
                                    color: blue,
                                  )),
                              child: Icon(
                                Icons.star_border_outlined,
                                color: blue,
                                size: 30,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12.5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                  border: Border.all(
                                    width: 1,
                                    color: green,
                                  )),
                              child: Icon(
                                Icons.favorite_border,
                                color: green,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 28,
                      child: SizedBox(
                        width: w,
                        child: ValueListenableBuilder(
                            valueListenable: activeBanner,
                            builder: (context, active, _) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (var i = 0; i < photos.length; i++)
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: active == i
                                              ? white
                                              : white.withOpacity(0.5),
                                          shape: BoxShape.circle),
                                    )
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Анна, 30',
                      style: mediumText,
                    ),
                    Text(
                      '69%',
                      style: highlightedText,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 32,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var hobby in hobbies)
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 98,
                        height: 32,
                        decoration: hobby.decoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              hobby.icon,
                              height: 16,
                            ),
                            Text(
                              hobby.title,
                              style: hobby.stylet,
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  List<Hobby> hobbies = [
    Hobby(
        title: "Рисование",
        icon: "assets/icons/paintbrush.png",
        decoration: BoxDecoration(
            gradient: primaryGradient, borderRadius: BorderRadius.circular(15)),
        stylet: smallText),
    Hobby(
        title: "Вязание",
        icon: "assets/icons/yarn.png",
        decoration:
            BoxDecoration(color: gray, borderRadius: BorderRadius.circular(15)),
        stylet: smallText.copyWith(color: black)),
    Hobby(
        title: "Футбол",
        icon: "assets/icons/ball.png",
        decoration:
            BoxDecoration(color: gray, borderRadius: BorderRadius.circular(15)),
        stylet: smallText.copyWith(color: black)),
    Hobby(
        title: "Футбол",
        icon: "assets/icons/ball.png",
        decoration:
            BoxDecoration(color: gray, borderRadius: BorderRadius.circular(15)),
        stylet: smallText.copyWith(color: black))
  ];
}

class Hobby {
  String title;
  String icon;
  BoxDecoration decoration;
  TextStyle stylet;

  Hobby(
      {required this.title,
      required this.icon,
      required this.decoration,
      required this.stylet});
}
