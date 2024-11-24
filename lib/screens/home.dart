import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_editor/screens/photos.dart';
import 'package:image_editor/screens/tab_home.dart';
import 'package:image_editor/screens/videos.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin {
  late final TabController _tabController;
  late AnimationController _animationController;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;
  late final List<String> _menuItems = ['Home', 'Settings', 'About'];

  String _activeTile = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _tabController = TabController(length: 3, vsync: this);
    _topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1)
    ]).animate(_animationController);
    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1)
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Photo Editor'),
          bottom: TabBar(
            padding: EdgeInsets.all(4),
            splashFactory: NoSplash.splashFactory,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicatorPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 34, 50, 64),
                  Colors.green,
                ],
              ),
              shape: BoxShape.rectangle,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home)),
              Tab(
                icon: Icon(Icons.photo),
              ),
              Tab(
                icon: Icon(Icons.video_library),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Center(
                  child: Text(
                    'My Photo Editor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _menuItems.length,
                      itemBuilder: (context, index) {
                        String menuItem = _menuItems[index];
                        bool isActive = _activeTile == menuItem;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, _) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: isActive
                                              ? Colors.black.withOpacity(0.2)
                                              : Colors.transparent,
                                          blurRadius: 10,
                                          spreadRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                      gradient: LinearGradient(
                                          begin: _topAlignmentAnimation.value,
                                          end: _bottomAlignmentAnimation.value,
                                          colors: !isActive
                                              ? [
                                                  Colors.transparent,
                                                  Colors.transparent
                                                ]
                                              : [
                                                  const Color.fromARGB(
                                                      255, 34, 50, 64),
                                                  Colors.green,
                                                ]),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      shape: BoxShape.rectangle),
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        _animationController.forward(from: 0);

                                        _activeTile = isActive ? '' : menuItem;
                                      });
                                    },
                                    selected: isActive,
                                    shape: const StadiumBorder(),
                                    selectedTileColor: Colors.transparent,
                                    title: Text(
                                      menuItem,
                                      style: TextStyle(
                                          color: isActive
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                    leading: Icon(
                                      color: isActive
                                          ? Colors.white
                                          : Colors.black,
                                      menuItem == 'Home'
                                          ? Icons.home
                                          : menuItem == 'Settings'
                                              ? Icons.settings
                                              : Icons.more,
                                    ),
                                  ),
                                );
                              }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [TabHome(), Pictures(), Videos()],
        ));
  }
}

class _CenterCutPath extends CustomClipper<Path> {
  final double radius;
  final double thickness;
  _CenterCutPath({this.radius = 0, this.thickness = 1});

  @override
  Path getClip(Size size) {
    final rect = Rect.fromLTRB(
        -size.width, -size.width, size.width * 2, size.height * 2);
    final double width = size.width - thickness * 2;
    final double height = size.height - thickness * 2;

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(thickness, thickness, width, height),
            Radius.circular(radius - thickness)),
      )
      ..addRect(rect);

    return path;
  }

  @override
  bool shouldReclip(covariant _CenterCutPath oldClipper) {
    return oldClipper.radius != radius || oldClipper.thickness != thickness;
  }
}
