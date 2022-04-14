import 'package:flutter/material.dart';
import 'package:masakaja/models/masakan.dart';

class cardList extends StatelessWidget {

  final Masakan masakan;
  cardList(this.masakan);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  masakan.gambar,
                  width: 130,
                  height: 110,
                )),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(masakan.judul,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                SizedBox(
                  height: 5,
                ),
                Text(masakan.isi,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey)),
                SizedBox(height: 5),
                Text(masakan.penulis,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey)),
              ],
            ),
          ],
        )
      ],
    );
  }
}
