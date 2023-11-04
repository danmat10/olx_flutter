import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx_flutter/models/ad_model.dart';
import 'package:olx_flutter/models/user_model.dart';
import 'package:olx_flutter/services/ad_service.dart';
import 'package:olx_flutter/views/ad/ad_view_screen.dart';
import 'package:olx_flutter/views/user/login_screen.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AdService adService = AdService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OLX'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implemente a ação de pesquisa aqui
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Adicionar anúncio'),
              onTap: () async {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Ad>>(
        future: adService.getAds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar anúncios"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhum anúncio disponível"));
          } else {
            List<Ad> ads = snapshot.data!;
            return ListView.builder(
              itemCount: ads.length,
              itemBuilder: (context, index) {
                Ad ad = ads[index];
                return ListTile(
                  leading: Image.network(ad.images[0], width: 50),
                  title: Text(ad.title),
                  subtitle: Text(ad.location),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewAdScreen(ad: ad)));
                  },
                  trailing: Text(
                    'R\$${ad.price.toString()}',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
