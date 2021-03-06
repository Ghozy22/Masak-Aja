import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/retry.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masakaja/models/masakan.dart';
import 'package:masakaja/widget/card_list.dart';
import 'package:http/http.dart' as http;


class home extends StatefulWidget {
  const home({ Key? key }) : super(key: key);
  
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  TextEditingController judul = TextEditingController();
  TextEditingController isi = TextEditingController();
  TextEditingController penulis = TextEditingController();
  TextEditingController id = TextEditingController();



  Future getData() async {

    List list;
    int index;

    var response = await http.get(
    Uri.parse("http://172.17.223.129/MasakAja/Show.php"));
  
    return jsonDecode(response.body);
    
  }

  String getImage(){
     String img = "https://source.unsplash.com/random/900×700/?food";

      return img;

  }

  Future edit() async {
    var response = await http.post(
    Uri.parse("http://172.17.223.129/MasakAja/Edit.php"),
    body: {
      "id_postingan" : id.text,
      "judul": judul.text,
      "isi": isi.text,
      "penulis" : penulis.text,
    });

  }


  Future hapus() async {
    var response = await http.post(
    Uri.parse("http://172.17.223.129/MasakAja/Delete.php"),
    body: {
      "id_postingan" : id.text,
    });
  }


  Future posting() async {

    var response = await http.post(
    Uri.parse("http://172.17.223.129/MasakAja/Create.php"),
    body: {
      "judul": judul.text,
      "isi": isi.text,
      "penulis" : penulis.text,
    });

    var data = json.decode(response.body);

    if(data == "Error"){
      Fluttertoast.showToast(
        msg: "User Telah Terdaftar",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    } else {
      Fluttertoast.showToast(
        msg: "Pendaftaran Berhasil!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }



  }



  @override
  Widget build(BuildContext context) {
return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hallo, nama user!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black)),
                Text("Selamat Datang", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey)),
                SizedBox(height: 32,),
                Text("Rekomendasi Resep Masakan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                SizedBox(height: 32,),
                FutureBuilder( future: getData() , builder: (context,AsyncSnapshot snapshot){
                  if(snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData ? ListView.builder(shrinkWrap: true, itemCount: snapshot.data.length, itemBuilder: (context, index){
                    List list = snapshot.data;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        cardList(Masakan(id: list[index]["id_postingan"], judul: list[index]["judul"], bahan: "bahan", isi: "--->" , gambar: "https://source.unsplash.com/random/900×$index+00/?food", penulis: "Penulis : "+list[index]["Penulis"])),
                        Column(
                          children: [
                            Container(
                              width: 20,
                              child : GestureDetector(
                                child: Icon(Icons.edit),
                                onTap: (){
                                  setState(() {
                                    id.text = list[index]["id_postingan"];
                                    judul.text = list[index]["judul"];
                                    isi.text = list[index]["isi"];
                                    penulis.text = list[index]["Penulis"];
                                  });
                                  showModalBottomSheet(context: context, builder: (BuildContext context) {
            return Container(
              height: 800,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                              Text(
                                    'Edit Resep', style: GoogleFonts.josefinSans(
                                        textStyle: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        )
                                      ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                      controller: judul,
                                      obscureText: false,
                                      cursorColor: Colors.red,
                                      decoration: InputDecoration(
                                        hintText: "Judul",
                                        hintStyle: GoogleFonts.josefinSans(
                                          textStyle: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          )
                                        ),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffdfe8f3))
                                        )
                                      ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                      controller: isi,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 1,
                                      maxLines: 5,
                                      obscureText: false,
                                      cursorColor: Colors.red,
                                      decoration: InputDecoration(
                                        hintText: "isi",
                                        hintStyle: GoogleFonts.josefinSans(
                                          textStyle: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          )
                                        ),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffdfe8f3))
                                        )
                                      ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                      controller: penulis,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 1,
                                      maxLines: 5,
                                      obscureText: false,
                                      cursorColor: Colors.red,
                                      decoration: InputDecoration(
                                        hintText: "Penulis",
                                        hintStyle: GoogleFonts.josefinSans(
                                          textStyle: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          )
                                        ),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffdfe8f3))
                                        )
                                      ),
                              ),
                        ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () => Navigator.pop(context) , child: Text('tutup')),
                      ElevatedButton(onPressed: () { edit(); Navigator.pop(context); penulis.clear(); isi.clear(); judul.clear(); setState(() {
                            getData();
                      }); } , child: Text('Edit')),
                      ElevatedButton(onPressed: () { hapus(); Navigator.pop(context); penulis.clear(); isi.clear(); judul.clear(); setState(() {
                            getData();
                      }); } , child: Text('Hapus')),
                    ],
                  )
                ],
              ),
            ),
          );
        } );
                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> EditData(lisT: list, index: index) ));
                                  debugPrint("Edit Cliicked");
                                },
                              )
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: GestureDetector(
                                child: Icon(Icons.looks),
                                onTap: (){
                                          showModalBottomSheet(context: context, builder: (BuildContext context) {
                                            
         return Container(
          height: MediaQuery.of(context).size.height * 100,
           child: SafeArea(
        child: Stack(
            
            children: [
              Image.network('https://source.unsplash.com/random/900×$index+00/?food',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
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
                            Text(list[index]["judul"], style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),),
                            SizedBox(height: 20),
                            Text(list[index]["isi"], style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
                            SizedBox(height: 20,),
                            Text("Penulis : " + list[index]["Penulis"], style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
                            SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(onPressed: (){
                                Navigator.pop(context);
                              },
                               padding: EdgeInsets.only(top: 15, bottom: 15),
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                               elevation: 0,
                               color: Color.fromARGB(255, 255, 196, 0),
                               child: Text('Kembali', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 255, 255, 255)),),
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
     } );
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    );
              
                  } ) : CircularProgressIndicator();
                }
                ),
                
              ],
            ),
            
          ),
          
        ),
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          judul.text = "";
          isi.text = "";
          penulis.text = "";
        });
        showModalBottomSheet(context: context, builder: (BuildContext context) {
          return Container(
            height: 400,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                              'Tambahkan Resep', style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  )
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                                controller: judul,
                                obscureText: false,
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  hintText: "Judul",
                                  hintStyle: GoogleFonts.josefinSans(
                                    textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    )
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xffdfe8f3))
                                  )
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                                controller: isi,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                minLines: 1,
                                maxLines: 5,
                                obscureText: false,
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  hintText: "isi",
                                  hintStyle: GoogleFonts.josefinSans(
                                    textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    )
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xffdfe8f3))
                                  )
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                                controller: penulis,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                minLines: 1,
                                maxLines: 5,
                                obscureText: false,
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  hintText: "Penulis",
                                  hintStyle: GoogleFonts.josefinSans(
                                    textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    )
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xffdfe8f3))
                                  )
                                ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () => Navigator.pop(context) , child: Text('tutup')),
                      ElevatedButton(onPressed: () { posting(); Navigator.pop(context); penulis.clear(); isi.clear(); judul.clear(); setState(() {
                        getData();
                      }); } , child: Text('Save')),
                    ],
                  )
                ],
              ),
            ),
          );
        } );
      },
      backgroundColor: Color.fromARGB(255, 255, 196, 0),
      child: const Icon(Icons.add),
      ),
    );
  }
}