import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kanzangshop/components/components.dart';

class NetworkHelper {
  Future getProductDetails(String sessionid, dynamic product) async {
    http.Response response = await http.get(
        Uri.http(kAuthority, 'products/$product'),
        headers: {'Content-Type': 'application/json', 'session-id': sessionid});
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }
    print(response.statusCode);
  }

  Future getProductList(String sessionid) async {
    http.Response response = await http.get(Uri.http(kAuthority, 'products'),
        headers: {'Content-Type': 'application/json', 'session-id': sessionid});
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }

  Future login(String userName, String password) async {
    final body = {'username': userName, 'password': password};
    http.Response response = await http.post(
        Uri.http(kAuthority, 'users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
