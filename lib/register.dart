import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masakaja/home_screen.dart';
import 'package:masakaja/main.dart';

class Register extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        _loginLabel(),
                        const SizedBox(height: 70,),
                        _labelTextInpit("email", "Email Anda", false),
                        const SizedBox(height: 40,),
                        _labelTextInpit("password", "Password Anda", true),
                        const SizedBox(height: 40,),
                         _labelTextInpit("nama", "Nama Anda", false),
                        const SizedBox(height: 40,),
                        _labelTextInpit("No Telpon", "No Telpon Anda", false),
                        const SizedBox(height: 60,),
                        Container(
                          width: double.infinity,
                              height: 60,
                              decoration:const BoxDecoration(
                                color: Color(0xff008fff),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'login'),));
                              }, 
                              child: Text("Register",
                              style: GoogleFonts.josefinSans(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24,

                                )
                              ),)),
                        ),
                        const SizedBox(height: 40,),
                        _signupLabel("Sudah Memiliki Akun?", const Color(0xff909090) ),
                        const SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: _signupLabel("Login", const Color(0xff909090) )),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                )
              ],
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
    child: Text("Register",
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
    child: Text("Register", style: GoogleFonts.josefinSans(
      textStyle: const TextStyle(color: Color(0xff164276),
      fontWeight: FontWeight.w900,
      fontSize: 34
      )),
  ));
}