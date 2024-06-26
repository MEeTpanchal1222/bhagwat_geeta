import 'package:bhagwat_geeta/uitels/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../uitels/listonly.dart';
class ShlokList extends StatefulWidget {
  const ShlokList({super.key});

  @override
  State<ShlokList> createState() => _ShlokListState();
}

late double height, width;
int chapterIndex = 0;

class _ShlokListState extends State<ShlokList> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;



    return Scaffold(
      backgroundColor: colororg,
      appBar: AppBar(title: Text('Gita'),backgroundColor: Color(0xffffc342),elevation: 5,),
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
      height: 500,
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
            width: width,
            margin: const EdgeInsets.only(bottom: 80),
            decoration: BoxDecoration(
              color: colorcream,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
              child: Column(
                //list of title box using list.generate
                children: List.generate(
                    gitadata[0]['chapters'][chapterIndex]['shloks'].length,
                        (index) => titleBox(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //title box
  titleBox(int index) {
    return Container(
      width: width,
      decoration: BoxDecoration(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 12),
            child: Column(
              children: [
                index == 0
                    ? Column(
                  children: [
                    Text(
                      gitadata[0]['chapters'][chapterIndex]['id'],
                      style: TextStyle(
                        fontSize: height / 50,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      gitadata[0]['chapters'][chapterIndex]['name'],
                      style: TextStyle(
                        fontSize: height / 35,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                )
                    : const SizedBox(),

                //shlok
                addText(index: index, key: 'shlok'),

                //divider
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    color: divider,
                  ),
                ),

                //meaning of shlok
                addText(index: index, key: 'meaning'),
              ],
            ),
          ),

          //copy and share button
          addCpyShareBtn(),
        ],
      ),
    );
  }

  //udf text
  addText({required int index, required String key}) {
    return Text(
      gitadata[0]['chapters'][chapterIndex]['shloks'][index][key],
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: height / 34,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }

  addCpyShareBtn() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
        color: Color(0xff2e2e2e),
      ),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textBtn(btnName: 'COPY',),
          const SizedBox(
            width: 50,
          ),
          textBtn(btnName: 'SHARE'),
        ],
      ),
    );
  }

  textBtn({required String btnName,String? meet}) {
    return CupertinoButton(
      onPressed: () {
        Clipboard.setData(ClipboardData(text: meet!));

        if (btnName == 'COPY') {
          const snackBar = SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              'Copied!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Text(
        btnName,
        style: TextStyle(
          fontSize: height / 45,
          fontWeight: FontWeight.bold,
          color: const Color(0xfffeb211),
        ),
      ),
    );
  }
}