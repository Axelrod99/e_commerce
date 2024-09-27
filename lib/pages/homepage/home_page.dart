import 'package:e_commerce/pages/homepage/main_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // print("current height is " +MediaQuery.of(context).size.height.toString());
    return Scaffold(
        // color: Colors.grey[100],
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Column(
              children: [
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Bangladesh',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 117, 202, 191),
                              ),
                            ),
                            Row(
                              children: [
                                Text('options'),
                                Icon(Icons.arrow_drop_down_rounded)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      // Replace Row with Container
                      width: 40, // Adjust width as needed
                      height: 40,
                      // child: Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 117, 202, 191),
                      ),
                      // ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(child: SingleChildScrollView(
                  child: MainPageBody(),
                ))
              ],
            ),
          ),
        ));
  }
}
