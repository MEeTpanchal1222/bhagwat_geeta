import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../uitels/colors.dart';
import '../uitels/listonly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late double height, width;

class _HomeScreenState extends State<HomeScreen> {
  // int count = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colororg,
      body: Stack(
        children: [
          //background image of body
          bgImgContainer(),

          //titles
          addColumn(),
        ],
      ),
    );
  }

  //background image of body
  bgImgContainer() {
    return Container(
      height: 400,
      color: colororg,
      child: Image.asset(
        'assest/appBG.png',
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }

//gita text and titles
  addColumn() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //gita text image
          SizedBox(
            height: height / 3.5,
            child: Image.asset(
              'assest/text.png',
              height: 130,
              width: 130,
            ),
          ),

          //all titles
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            width: width,
            decoration: BoxDecoration(
              color: colorcream,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 26.0, horizontal: 16),
              child: Column(
                //list of title box using list.generate
                children:
                List.generate(gitadata.length, (index) => titleBox(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }


  titleBox(int index) {

    return CupertinoButton(
      onPressed: () {
        if (index == 0) {
          Navigator.pushNamed(context, '/chapters');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/saar');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/maahaatmy');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/aaratee');
        }
      },
      pressedOpacity: 0.8,
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 6),
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 1,
              )
            ],
            gradient: const LinearGradient(
              colors: [
                Color(0xfffeb211),
                Color(0xffffc342),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            Image.asset(
              'assest/icon${index + 1}.png',
              height: height / 12,
              width: 80,
            ),
            Container(
              height: height / 12,
              width: 1,
              color: divider,
            ),
            Expanded(
              child: Center(
                child: Text(
                  gitadata[index]['index'],
                  style: TextStyle(
                    fontSize: height / 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}