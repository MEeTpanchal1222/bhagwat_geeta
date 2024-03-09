import 'package:bhagwat_geeta/uitels/colors.dart';
import 'package:flutter/material.dart';
import '../uitels/listonly.dart';

class Aaratee extends StatefulWidget {
  const Aaratee({super.key});

  @override
  State<Aaratee> createState() => _AarateeState();
}

late double height, width;

class _AarateeState extends State<Aaratee> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colororg,
      body: Stack(
        children: [
          bgImgContainer(),
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


  addColumn() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(
            height: height / 3.5,
            child: Image.asset(
              'assest/text.png',
              height: 130,
              width: 130,
            ),
          ),


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
                  children: [
                    Container(
                      width: width,
                      decoration:  BoxDecoration(
                        color: colorcream,
                        borderRadius: BorderRadius.circular(20),
                      ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
                    child: Column(
                      //list of title box using list.generate
                        children: [
                        Container(
                        width: width,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 12),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      gitadata[3]['index'],
                                      style: TextStyle(
                                        fontSize: height / 40,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    addText(),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //copy and share button
                          addCpyShareBtn(),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    ),
    ),],
    ),
    );
  }

  //udf text
  addText() {
    return Text(
      gitadata[3]['aaratee'],
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: height / 50,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }

  addCpyShareBtn() {
    return Container(
      height: 10,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
        color: Color(0xff2e2e2e),
      ),
      width: width,
    );
  }
}