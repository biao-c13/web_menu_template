import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AppUrl {
  static const String baseUrl = 'www.100language.com';
  // ignore: constant_identifier_names
  static const String Login = baseUrl + 'insertNewUser.php';

  Future<Response> responseGet(fileName) async {
    var url = Uri.https('www.100language.com',
        '/dailylanguageCH-ITA/' + fileName, {'q': '{http}'});
    return await http
        .get(url, headers: {"charset": "utf-8", "Accept-Charset": "utf-8"});
  }
}
