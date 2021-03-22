import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:mobile_sisola_dev/provider/data/kontrak_data.dart';
import 'package:mobile_sisola_dev/utils/constant/constanta_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServicesKontrak with ChangeNotifier {
  List<Kontrak> _kontrak = [];

  List<Kontrak> get kontrak {
    return [..._kontrak];
  }

  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<void> getAllContract(String email) async {
    final uri = Uri.http(urlApi, getCustContPath);
    final soCode = spesialCode;
    final SharedPreferences sp = await _pref;
    final token = sp.getString('token');

    print("token from sp = $token");

    Map<String, dynamic> body = {"cust_email": email};

    final bodyJson = jsonEncode(body);
    final bodyUtf8 = utf8.encode(bodyJson);
    final sigUtf8 = utf8.encode("$bodyJson$soCode");

    final bodyBase64 = base64Encode(bodyUtf8);
    final signature = sha1.convert(sigUtf8);

    var dataBody = jsonEncode(
        {"paramrequest": bodyBase64, "signature": signature.toString()});

    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token"
        },
        body: dataBody);

    List<Kontrak> listKontrak = [];

    if (response.statusCode != 200) {
      return;
    }

    var decode = jsonDecode(response.body);

    if (decode['STATUS_TYPE'] != "MSG") {
      return;
    }

    for (var item in decode['RESULT']) {
      // print(item.);
      Kontrak contract = Kontrak.fromJson(item);

      listKontrak.add(contract);
    }

    _kontrak = listKontrak;

    notifyListeners();
  }
}
