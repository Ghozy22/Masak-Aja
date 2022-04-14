import 'package:flutter/material.dart';
import 'package:masakaja/models/masakan.dart';
import 'package:masakaja/widget/card_list.dart';

class homeScreen extends StatelessWidget {

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
                cardList(Masakan(id: 1, judul: 'Judul Masakan', bahan: 'bahan', isi: 'Masakan makanan masakan..', gambar: 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/04/07/4251160885.jpg', penulis: 'Nana')),
                cardList(Masakan(id: 1, judul: 'Judul Masakan', bahan: 'bahan', isi: 'Masakan makanan masakan..', gambar: 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/04/07/4251160885.jpg', penulis: 'Nana')),
                cardList(Masakan(id: 1, judul: 'Judul Masakan', bahan: 'bahan', isi: 'Masakan makanan masakan..', gambar: 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/04/07/4251160885.jpg', penulis: 'Nana')),
                cardList(Masakan(id: 1, judul: 'Judul Masakan', bahan: 'bahan', isi: 'Masakan makanan masakan..', gambar: 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/04/07/4251160885.jpg', penulis: 'Nana')),
                cardList(Masakan(id: 1, judul: 'Judul Masakan', bahan: 'bahan', isi: 'Masakan makanan masakan..', gambar: 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/04/07/4251160885.jpg', penulis: 'Nana')),
              ],
            ),
          ),
        )
      ),
    );
  }
}