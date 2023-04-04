import 'package:app_getx/content_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF69c5df),
      body:
      Stack(
          children: [
            Positioned(
              top:0,
              left: 0,
              height: 700,
              child: Container(
                height: 700,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/background.jpg"),
                        fit:BoxFit.cover
                    )
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Pick Your Favourite",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),),
                const Text("Contests",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),),
                const SizedBox(height: 40,),
                SizedBox(
                  width: MediaQuery.of(context).size.width-25,
                        child: const Text("We make great design work "
                            "happen with our great community designer",
                        style: const TextStyle(
                          color: Colors.white60
                        ),)),
                const SizedBox(height: 40,),
                Container(
                  width: 200,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFffbc33e)
                  ),


                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: const Color(0xFFfbc33e),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),),
                      onPressed: ()=>Get.to(()=>ContentPage()),
                      child: const Text(
                        "Get started",
                        style: TextStyle(
                          color:Colors.white
                        ),
                      ),
                    ),

                ),
                const SizedBox(height: 70,),

              ],
            ))

          ],
        ),

    );
  }
}