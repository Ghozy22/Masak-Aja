import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masakaja/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Masak Aja',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            child: Stack(
              children: [
                Positioned(
                  top: 200,
                  left: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color(0x304599ff),
                      borderRadius: BorderRadius.all(Radius.circular(150))
                    ),
                )
                ),
                Positioned(
                  bottom: 10,
                  right: -10,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0x30cc33d),
                      borderRadius: BorderRadius.all(Radius.circular(100),
                    ),
                ))
                ),
                Positioned(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(

                ),
                )
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const SizedBox(height: 50,),
                        _logo(),
                        const SizedBox(height: 50,),
                        _loginLabel(),
                        const SizedBox(height: 70,),
                        _labelTextInpit("email", "nanan@gmail.com", false),
                        const SizedBox(height: 40,),
                        _labelTextInpit("password", "password", true),
                        const SizedBox(height: 60,),
                        Container(
                          width: double.infinity,
                              height: 60,
                              decoration:const BoxDecoration(
                                color: Color(0xff008fff),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen(),));
                              }, 
                              child: Text("login",
                              style: GoogleFonts.josefinSans(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24,

                                )
                              ),)),
                        ),
                        const SizedBox(height: 40,),
                        _signupLabel("no akun", const Color(0xff909090) ),
                        const SizedBox(height: 10,),
                        _signupLabel("Daftar", const Color(0xff909090) )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _signupLabel(String label, Color textColor){
  return Text(label,
      style: GoogleFonts.josefinSans(
        textStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        )
      ),
    );
}

Widget _loginBtn(){
  return Container(
    width: double.infinity,
    height: 40,
    decoration:const BoxDecoration(
      color: Color(0xff008fff),
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: TextButton(onPressed: (){
    }, 
    child: Text("login",
    style: GoogleFonts.josefinSans(
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      )
    ),)),
  );
}

Widget _labelTextInpit(String label, String hint, bool isPassword){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label, style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
            color: Color(0xff8fa1b6),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          )
        ),
      ),
      TextField(
        obscureText: isPassword,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              color: Color(0xffc5d2e1),
              fontWeight: FontWeight.w400,
              fontSize: 20,
            )
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffdfe8f3))
          )
        ),
      )
    ],
  );
}

Widget _logo(){
  return Center(
    child: SizedBox(
      child: Image.network("https://i.imgur.com/dGo8DOk.jpg"),
      height: 80,
    ),
  );
}

Widget _loginLabel(){
  return Center(
    child: Text("Login", style: GoogleFonts.josefinSans(
      textStyle: const TextStyle(color: Color(0xff164276),
      fontWeight: FontWeight.w900,
      fontSize: 34
      )),
  ));
}