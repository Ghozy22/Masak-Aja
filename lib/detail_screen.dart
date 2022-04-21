import 'package:flutter/material.dart';

class detailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network('https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/04/07/4251160885.jpg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            ),
            Padding(padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/btn_back.png', width: 40,),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 264,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                    ),
                    color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 24
                      ),
                      child: Column(
                        children: [
                          Text("Judul Masakan", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),),
                          SizedBox(height: 20),
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
                          SizedBox(height: 20,),
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
                          SizedBox(height: 20,),
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
                          SizedBox(height: 20,),
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(onPressed: (){},
                             padding: EdgeInsets.only(top: 15, bottom: 15),
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                             elevation: 0,
                             color: Color.fromARGB(255, 255, 196, 0),
                             child: Text('Whsilist', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 255, 255, 255)),),
                             ),
                          )
                        ],
                      ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}