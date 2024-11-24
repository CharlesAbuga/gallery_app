import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class TabHome extends StatelessWidget {
  const TabHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              width: 100,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  width: 2,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      const Color.fromARGB(255, 34, 50, 64),
                      Colors.green,
                    ],
                  ),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                  textAlign: TextAlign.center,
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(height: 24),
            const Align(
                alignment: Alignment.centerLeft, child: Text('My Albums')),
            StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 166,
                  height: 166,
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 34, 50, 64),
                          Colors.green,
                        ],
                      ),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(Icons.add, size: 44, color: Colors.black),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  width: 166,
                  height: 166,
                  child: GridView.builder(
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
            const Text(
              'Hello, World!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}



//  Stack(
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.greenAccent,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     Positioned(
//                       right: 10,
//                       bottom: 10,
//                       child: Stack(
//                         children: [
//                           Transform.rotate(
//                             angle: -0.1,
//                             child: Transform.translate(
//                               offset: const Offset(-4, 0),
//                               child: Container(
//                                 width: 20,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.2),
//                                       blurRadius: 6,
//                                       spreadRadius: 1,
//                                       offset: const Offset(0, 3),
//                                     ),
//                                   ],
//                                   color: Colors.grey[600],
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Transform.rotate(
//                             angle: 0.0,
//                             child: Transform.translate(
//                               offset: const Offset(0, 0),
//                               child: Container(
//                                 width: 20,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[500],
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Transform.rotate(
//                             angle: 0.1,
//                             child: Transform.translate(
//                               offset: const Offset(4, 0),
//                               child: Container(
//                                 width: 20,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[400],
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: const Icon(
//                                   Icons.add,
//                                   color: Colors.white,
//                                   size: 10,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )