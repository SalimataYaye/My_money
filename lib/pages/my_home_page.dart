import 'package:flutter/material.dart';
import 'package:my_money/component/colors.dart';
import 'package:my_money/widgets/buttons.dart';
import 'package:my_money/widgets/text_size.dart';

import '../widgets/large_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
            _textContainer() ,


          ],
        ),
      ),
    );
  }

  _headSection () {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
      bottom: 10,
        left: 0,
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "images/background.png"
                )
            )
          ),
        )
    );
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
        right: -2,
        bottom: 10,
        child: Container(
          height: MediaQuery.of(context).size.height*0.1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "images/curve.png"
                  )
              )
          ),
        ),
    );
  }

  _buttonContainer() {
    return Positioned(
      right: 58,
        bottom: 15,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              barrierColor: Colors.transparent,
              backgroundColor: Colors.transparent,
                context: context, 
                builder: (BuildContext bc){
                  return Container(
                    height: MediaQuery.of(context).size.height-240,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                            child: Container(
                              color: const Color(0xFFeef1f4).withOpacity(0.7),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height-300,
                            )
                        ),
                        Positioned(
                          right: 58,
                            child: Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 25),
                              width: 60,
                              height: 250,
                              decoration: BoxDecoration(
                                color: AppColor.mainColor,
                                borderRadius: BorderRadius.circular(29)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButtons(
                                    icon: Icons.cancel,
                                    iconColor: AppColor.mainColor,
                                    backgroundColor: Colors.white,
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                  AppButtons(
                                    icon: Icons.add,
                                    iconColor: AppColor.mainColor,
                                    backgroundColor: Colors.white,
                                    onTap: (){},
                                    textColor: Colors.white,
                                    text: "Add Bill",

                                  ),
                                  AppButtons(
                                    icon: Icons.history,
                                    iconColor: AppColor.mainColor,
                                    backgroundColor: Colors.white,
                                    text: "History",
                                    textColor: Colors.white,
                                    onTap: (){

                                    },
                                  )
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage('images/lines.png')),
              boxShadow: [BoxShadow(
                blurRadius: 15,
                offset: const Offset(0, 1),
                color: const Color(0xFF11324d).withOpacity(0.2)
              )],
            )
          ),
        )
    );
  }

  _listBills() {
    return Positioned(
      top: 320,
      left: 0,
      right: 0,
      bottom: 0,
      child:  MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (_,index){
            return Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              height: 130,
              width: MediaQuery.of(context).size.width-20,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFd8dbe0),
                        offset: Offset(1, 1),
                        blurRadius: 20,
                        spreadRadius: 10
                    )
                  ]
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 3,
                                      color: Colors.redAccent
                                  ),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "images/brand1.png"
                                      )
                                  )
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "KenGen Power",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                Text(
                                  "ID:3984754387",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedText(text: "Auto pay on 24th May 2024", color: AppColor.green),
                        const SizedBox(height: 5,)
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.selectBackground
                                ),
                                child: Center(
                                  child:  Text(
                                    'Select',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.selectColor,
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                child: Container(

                                )
                            ),
                            Text(
                              '\$1240',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.mainColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Due in 3 days',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColor.idColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                        SizedBox(width: 5,),
                        Container(
                          width: 5,
                          height: 35,
                          decoration: BoxDecoration(
                              color: AppColor.halfOval,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _payButton(){
    return const Positioned(
      bottom: 20,
        child: AppLargeButton(text: "Pay all bills",textColor: Colors.white)
    );
  }

  _textContainer() {
      return const Stack(
        children: [
          Positioned(
              left: 0,
              top: 100,
              child: Text(
                "My Bills",
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF293952)
                ),
              )
          ),
          Positioned(
              left: 40,
              top: 80,
              child: Text(
                "My Bills",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              )
          ),
        ],
      );
    }

}

