import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_sisola_dev/utils/constant/constanta_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundServices {
  Future<void> getToken() async {
    print("Akses get Token");

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token') ?? "";

    final urlService = new Uri.http(urlApi, tokenPath);

    final dataBody = jsonEncode(<String, String>{
      "client_id": clientId,
      "client_secret": clientSecret,
      "grant_type": grantType,
      "scope": scope
    });

    final response = await http.post(urlService,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: dataBody);

    print("Response = ${response.statusCode}, ${response.body}, ");

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      token = decode['access_token'];
    }

    await pref.setString('token', token);

    print(token);
  }
}
