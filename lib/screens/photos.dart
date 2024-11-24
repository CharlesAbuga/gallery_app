import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Pictures extends StatelessWidget {
  const Pictures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    'My Photos',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 3, crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            spreadRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
