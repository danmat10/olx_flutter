import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:olx_flutter/models/ad_model.dart';

class AdService {
  final CollectionReference _adsCollection =
      FirebaseFirestore.instance.collection('ads');

  Future<void> createAd(Ad ad) async {
    await _adsCollection.add(ad.toMap());
  }

  Future<List<Ad>> getAds() async {
    QuerySnapshot querySnapshot = await _adsCollection.get();
    return querySnapshot.docs.map((doc) {
      return Ad.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
