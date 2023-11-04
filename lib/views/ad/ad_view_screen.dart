import 'package:flutter/material.dart';
import 'package:olx_flutter/models/ad_model.dart';

class ViewAdScreen extends StatelessWidget {
  final Ad ad;

  ViewAdScreen({required this.ad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anúncio"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: PageView.builder(
                itemCount: ad.images.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Center(
                        child: Image.network(
                          ad.images[index],
                          height: 250,
                        ),
                      ),
                      Positioned(
                        child: Text("${index + 1}/${ad.images.length}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        right: 10,
                        bottom: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
            Text(
              'R\$ ${ad.price.toString()}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              ad.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              'Descrição',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(ad.description),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
