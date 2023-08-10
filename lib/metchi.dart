import 'dart:ui' as ui;

import 'package:blur/blur.dart';
import 'package:iskra/filters.dart';
import 'package:iskra/global.dart';
import 'package:flutter/material.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
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
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FilterSwipe()));
                }),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13, top: 23, bottom: 13),
                child: Text(
                  'Лайки',
                  style: mediumTitle,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                height: 135,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var like in likedPeople)
                      Container(
                        width: w * 0.25,
                        margin: EdgeInsets.only(right: 8),
                        child: Builder(builder: (context) {
                          double ww = MediaQuery.of(context).size.width;
                          double hh = MediaQuery.of(context).size.height;
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    width: ww,
                                    height: hh,
                                    child: Image.asset(
                                      like.img,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BackdropFilter(
                                  filter: ui.ImageFilter.blur(
                                      sigmaX: 3.0, sigmaY: 3.0),
                                  child: Container(
                                    width: ww,
                                    height: hh,
                                    color: red.withOpacity(0.005),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 8,
                                  left: 8,
                                  child: Text(
                                    like.name,
                                    style: buttonText,
                                  ))
                            ],
                          );
                        }),
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, top: 23, bottom: 13),
                child: Text(
                  'Новые пары',
                  style: mediumTitle,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                height: 135,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var like in likedPeople)
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            child: Image.asset(like.img).frosted(
                              blur: 5,
                              frostOpacity: 0.5,
                              frostColor: white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Positioned(
                              bottom: 8,
                              left: 8,
                              child: Text(
                                like.name,
                                style: buttonText,
                              ))
                        ],
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, top: 23, bottom: 13),
                child: Text(
                  'Чаты',
                  style: mediumTitle,
                ),
              ),
              for (var i = 0; i < 4; i++)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          right: 17, left: 11, bottom: 11),
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/banner-like.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Анна',
                            style: xsText,
                          ),
                          Text(
                            'Привет! Я увидела ваш профиль, и думаю, что у нас могут быть общие интересы. Я ищу...',
                            style: smallText.copyWith(
                                color: Color(0xff787878),
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          )
                        ],
                      ),
                    )
                  ],
                )
            ],
          ),
        ));
  }

  List<Like> likedPeople = [
    Like(img: 'assets/banner-girl.png', name: 'Анна'),
    Like(img: 'assets/banner-like.png', name: 'Анна'),
    Like(img: 'assets/banner-like.png', name: 'Анна'),
    Like(img: 'assets/banner-like.png', name: 'Анна'),
    Like(img: 'assets/banner-like.png', name: 'Анна'),
    Like(img: 'assets/banner-like.png', name: 'Анна'),
  ];
}

class Like {
  String img;
  String name;

  Like({required this.img, required this.name});
}

class FrostedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage('assets/background_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.white.withOpacity(0.0),
          ),
        ),
      ],
    );
  }
}
