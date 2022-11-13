import 'package:http/http.dart' as http;
import 'package:web_menu_template/classes/dishes.dart';

class SqlApiService {
  static const String GET_ALL_DISHES = "GET_ALL_DISHES";
  static const String ADD_ORDER = "ADD_ORDER";

  static Future<List<Dishes>> GetAllDishes() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_ALL_DISHES;
      http.Response response = await sqlServiceResponse(map);
      return dishesfromJson(response.body);
    } catch (e) {
      // print(e);
      return <Dishes>[];
    }
  }

  static Future<String> addOrder() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = ADD_ORDER;
      map['numberCustomer'] = '36';
      map['cost'] = '6.02';
      //   print(map);
      http.Response response = await sqlServiceResponse(map);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // print(response.statusCode);
        //  print(response.body.toString());
        return "error";
      }
    } catch (e) {
      //print(e);
      return "error";
    }
  }

  static Future<http.Response> sqlServiceResponse(map) async {
    //static const String baseUrl = 'www.100language.com';
    //static const String subPathUrl = '/webPageTemplate_Crud_Sql/sql_crud.php';
    var url = Uri.https('www.100language.com',
        '/webPageTemplate_Crud_Sql/sql_crud.php', {'q': '{http}'});
    return await http.post(url,
        body: map, headers: {"charset": "utf-8", "Accept-Charset": "utf-8"});
  }
}
