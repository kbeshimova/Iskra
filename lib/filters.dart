import 'package:flutter/material.dart';
import 'package:iskra/global.dart';
import 'package:iskra/swipe.dart';

class FilterSwipe extends StatefulWidget {
  const FilterSwipe({super.key});

  @override
  State<FilterSwipe> createState() => _FilterSwipeState();
}

class _FilterSwipeState extends State<FilterSwipe> {
  double startval = 0, endval = 0.5;
  double startval1 = 20, endval1 = 70;

  var selectedItems = <String, Map<String, bool>>{};

  @override
  void initState() {
    for (var i = 0; i < blocks.length; i++) {
      for (var o = 0; o < blocks[i].list.length; o++) {
        selectedItems["$i"] ??= {};
        selectedItems["$i"]![blocks[i].list[o].id] = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 150,
          backgroundColor: white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Hero(
              tag: 'mainlogo',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        'Расстояние',
                        style: mediumTitle,
                      ),
                    ),
                    RangeSliderWithDistance(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        'Возраст',
                        style: mediumTitle,
                      ),
                    ),
                    RangeSliderWithLabels(),
                    Padding(
                      padding: const EdgeInsets.only(top: 35, bottom: 6),
                      child: Text(
                        'Интересы',
                        style: mediumTitle,
                      ),
                    ),
                    TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        fillColor: Color(0xffDDDDDD),
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                        hintText: 'Поиск',
                        hintStyle: smallText.copyWith(color: Color(0xff787878)),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Color(0xff8E8E8E),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              for (var b = 0; b < blocks.length; b++)
                Builder(builder: (context) {
                  var block = blocks[b];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 21, bottom: 12),
                        padding: EdgeInsets.only(right: 20, left: 3),
                        decoration: BoxDecoration(color: block.color),
                        child: Text(
                          block.name,
                          style: smallTitle,
                        ),
                      ),
                      Builder(builder: (context) {
                        Map<String, List<Popular>> lists = {};

                        for (var i = 0; i < block.list.length; i++) {
                          if (i < 5) {
                            lists['0'] ??= [];
                            lists['0']!.add(block.list[i]);
                          } else {
                            var cindex = i ~/ 5;
                            lists['$cindex'] ??= [];
                            lists['$cindex']!.add(block.list[i]);
                          }
                        }
                        return Column(
                          children: [
                            for (var list in lists.values)
                              SizedBox(
                                height: h * 0.05,
                                child: ListView.builder(
                                  itemCount: list.length,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var popular = list[index];
                                    return Container(
                                      margin:
                                          EdgeInsets.only(right: 7, bottom: 10),
                                      child: FilterChip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        backgroundColor: selectedItems["$b"]
                                                    ?[popular.id] ??
                                                false
                                            ? block.color
                                            : lightGray,
                                        pressElevation: 0,
                                        onSelected: (value) {
                                          setState(() {
                                            selectedItems["$b"] ??= {};
                                            selectedItems["$b"]![popular.id] =
                                                !(selectedItems["$b"]
                                                        ?[popular.id] ??
                                                    true);
                                          });
                                        },
                                        label: Text(
                                          popular.title,
                                          style: smallText.copyWith(
                                              color: selectedItems["$b"]
                                                          ?[popular.id] ??
                                                      false
                                                  ? white
                                                  : black),
                                        ),
                                        avatar: Image.asset(
                                          popular.icon,
                                          fit: BoxFit.cover,
                                          height: 16,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        );
                      }),
                    ],
                  );
                }),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Swipe()));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                    margin: EdgeInsets.only(top: 47, bottom: 113),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: primaryGradient,
                    ),
                    child: Text(
                      'Применить',
                      style: buttonText,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  late List<PopularBlock> blocks = [
    PopularBlock(
        name: "Популярное", color: Color(0xff0092B2), list: popularies),
    PopularBlock(name: "Хобби", color: Color(0xffB10000), list: popularies),
    PopularBlock(name: "Спорт", color: Color(0xff7D0071), list: popularies),
    PopularBlock(
        name: "Темперамент", color: Color(0xff1A00B8), list: popularies)
  ];
  List<Popular> popularies = [
    Popular(
        id: '1',
        title: "Рисование",
        icon: "assets/icons/paintbrush.png",
        decoration: BoxDecoration(
            gradient: primaryGradient,
            borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '2',
        title: "Вязание",
        icon: "assets/icons/yarn.png",
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '3',
        title: "Футбол",
        icon: "assets/icons/ball.png",
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '4',
        title: "Футбол",
        icon: "assets/icons/ball.png",
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '5',
        title: "Рисование",
        icon: "assets/icons/paintbrush.png",
        decoration: BoxDecoration(
            gradient: primaryGradient,
            borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '6',
        title: "Вязание",
        icon: "assets/icons/yarn.png",
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '7',
        title: "Футбол",
        icon: "assets/icons/ball.png",
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '8',
        title: "Футбол",
        icon: "assets/icons/ball.png",
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '9',
        title: "Футбол",
        icon: "assets/icons/ball.png",
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '10',
        title: "Футбол",
        icon: "assets/icons/ball.png",
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.circular(15))),
    Popular(
        id: '11',
        title: "Футбол",
        icon: "assets/icons/ball.png",
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.circular(15))),
  ];
}

class PopularBlock {
  String name;
  Color color;
  List<Popular> list;
  PopularBlock({required this.name, required this.color, required this.list});
}

class Popular {
  String id;
  String title;
  String icon;
  BoxDecoration decoration;

  Popular({
    required this.id,
    required this.title,
    required this.icon,
    required this.decoration,
  });
}

class RangeSliderWithLabels extends StatefulWidget {
  @override
  _RangeSliderWithLabelsState createState() => _RangeSliderWithLabelsState();
}

class _RangeSliderWithLabelsState extends State<RangeSliderWithLabels> {
  // RangeValues _currentRangeValues = const RangeValues(0, 100);
  double _currentValue2 = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0'),
            Text('100'),
            // Text(_currentRangeValues.start.round().toString()),
            // Text(_currentRangeValues.end.round().toString()),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
            trackHeight: 0.5,
            showValueIndicator: ShowValueIndicator.always,
            valueIndicatorColor: Colors.transparent,
            valueIndicatorTextStyle: TextStyle(color: Colors.black),
          ),
          child: Slider(
            activeColor: black,
            inactiveColor: black,
            value: _currentValue2,
            min: 0,
            max: 100,
            label: '${_currentValue2.toInt()}',
            onChanged: (v) {
              setState(() {
                _currentValue2 = v;
              });
            },
          ),
          //  RangeSlider(
          //   activeColor: black,
          //   inactiveColor: black,
          //   values: _currentRangeValues,
          //   min: 0,
          //   max: 100,
          //   divisions: 100,
          //   labels: RangeLabels(
          //     _currentRangeValues.start.round().toString(),
          //     _currentRangeValues.end.round().toString(),
          //   ),
          //   onChanged: (RangeValues values) {
          //     setState(() {
          //       _currentRangeValues = values;
          //     });
          //   },
          // ),
        ),
      ],
    );
  }
}

class RangeSliderWithDistance extends StatefulWidget {
  @override
  _RangeSliderWithDistanceState createState() =>
      _RangeSliderWithDistanceState();
}

class _RangeSliderWithDistanceState extends State<RangeSliderWithDistance> {
  double _currentValue = 40;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0'),
            Text('1000'),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
            trackHeight: 0.5,
            showValueIndicator: ShowValueIndicator.always,
            valueIndicatorColor: Colors.transparent,
            valueIndicatorTextStyle: TextStyle(color: Colors.black),
          ),
          child: Slider(
            activeColor: black,
            inactiveColor: black,
            value: _currentValue,
            min: 0,
            max: 1000,
            label: '${_currentValue.toInt()}',
            onChanged: (v) {
              setState(() {
                _currentValue = v;
              });
            },
          ),
        ),
      ],
    );
  }
}
