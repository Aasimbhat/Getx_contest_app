import 'dart:convert';

import 'package:app_getx/recent_contest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentPage extends StatefulWidget {

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
List list=[];
List info=[];
_readData()async{
 await DefaultAssetBundle.of(context).loadString("json/recent.json").then((s) => {
   setState((){
     list=json.decode(s);
   })
  });
   await DefaultAssetBundle.of(context).loadString("json/detail.json").then((s) => {
   setState((){
     info=json.decode(s);
   })
  });
}

@override
void initState() {
  _readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    int _currentIndex  = 0;
    return       Scaffold(
        body: Container(
          padding: const EdgeInsets.only( top:70),
          color:const Color(0xFFc5e5f3),
          child: Column(
            children: [
              //james smith
              Container(
                width: width,
                height: 100,
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:const Color(0xFFebf8fd),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius:40,
                        backgroundImage: const AssetImage(
                            "assets/images1.jpeg"
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "James Smith",
                            style: const TextStyle(
                                color:Color(0xFF3b3f42),
                                fontSize: 18,
                                decoration: TextDecoration.none
                            ),
                          ),
                          const SizedBox(height: 5,),
                          const Text(
                            "Top Level",
                            style: const TextStyle(
                                color:const Color(0xFFfdebb2),
                                fontSize: 12,
                                decoration: TextDecoration.none
                            ),
                          ),

                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:const Color(0xFFf3fafc)
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.notifications,
                            color:Color(0xFF69c5df),
                            size: 30,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              //popular contest
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: [
                    const Text(
                      "Popular Contest",
                      style: const TextStyle(
                          color:Color(0xFF1f2326),
                          fontSize: 20,
                          decoration: TextDecoration.none
                      ),
                    ),
                    Expanded(child: Container()),
                    const Text(
                      "Show all",
                      style: const TextStyle(
                          color:Color(0xFFcfd5b3),
                          fontSize: 15,
                          decoration: TextDecoration.none
                      ),
                    ),

                    const SizedBox(width: 5,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFfdc33c)
                      ),
                      child: GestureDetector(

                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              //list
              Container(
                height: 220,
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.88),
                    itemCount: info.length,
                    itemBuilder: (_, i){
                      return GestureDetector(
                           onTap: (){
                            Get.toNamed("/detail",arguments: {
                             'title': info[i]['title'].toString(),
                             'text': info[i]['text'].toString(),
                             'name': info[i]['name'].toString(),
                             'img': info[i]['img'].toString(),
                             'time': info[i]['time'].toString(),
                             'prize': info[i]['prize'].toString(),
                           });
                           },

                        child: Container(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          height: 210,
                          width: MediaQuery.of(context).size.width-20,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color:i.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc)
                          ),
                          child: Column(
                            children: [
                              Container(
                                  child:Row(
                                    children: [
                                       Text(
                                        info[i]['title'],
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          color:Colors.white
                                        ),
                                      ),
                                      Expanded(child: Container())
                                    ],
                                  )
                              ),
                              const SizedBox(height: 9),
                              Container(
                                width: width,
                                child:  Text(
                                  info[i]['text'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color:const Color(0xFFb8eefc)
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Divider(thickness: 1.0,),
                              Row(
                                  children:[for(int i=0; i<4; i++)
                                    Container(

                                      width: 50,
                                      height: 50,
                                      child: Container(

                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image:  DecorationImage(
                                                image: AssetImage(
                                                    info[i]['img']
                                                ),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    )
                                  ]



                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 30,),
              //recent contests
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: [
                    const Text(
                      "Recent Contests",
                      style: const TextStyle(
                          color:Color(0xFF1f2326),
                          fontSize: 20,
                          decoration: TextDecoration.none
                      ),
                    ),
                    Expanded(child: Container()),
                    const Text(
                      "Show all",
                      style: TextStyle(
                          color:const Color(0xFFcfd5b3),
                          fontSize: 15,
                          decoration: TextDecoration.none
                      ),
                    ),

                    const SizedBox(width: 5,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFfdc33c)
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=>RecentContest());
                        },
                        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),

                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
               child:   MediaQuery.removePadding(context: context,
                      removeTop: true,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: list.length,
                          itemBuilder: (_, i){
                            return Container(
                              width: width,
                              height: 100,
                              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:const Color(0xFFebf8fd),
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                     CircleAvatar(
                                      radius:40,
                                      backgroundImage:  AssetImage(
                                          list[i]['img']
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Text(
                                          list[i]['status'],
                                          style: const TextStyle(
                                              color:Colors.orange,
                                              fontSize: 18,
                                              decoration: TextDecoration.none
                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                         SizedBox(
                                          width: 170,
                                          child:  Text(
                                            list[i]['text'],

                                            style: const TextStyle(
                                                color:Color(0xFF3b3f42),
                                                fontSize: 18,
                                                decoration: TextDecoration.none
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Container(
                                      width: 40,
                                      height: 70,

                                      child: const Text(
                                        "Time",
                                        style: const TextStyle(
                                            fontSize: 10,
                                            decoration: TextDecoration.none,
                                            color:const Color(0xFFb2b8bb)
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );
                          })

                  )

              ),
            ],
          ),
        ),
      );
  }
}