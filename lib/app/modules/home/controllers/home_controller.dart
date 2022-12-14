import 'dart:convert';
import 'package:alquran/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //Get All Surah
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://quran-api-indo.vercel.app/surah");
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }
}
