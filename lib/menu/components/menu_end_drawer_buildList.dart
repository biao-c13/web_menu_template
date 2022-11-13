import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_menu_template/classes/dishes.dart';
import 'package:web_menu_template/sql/sql_api_url.dart';

class MenuEndDrawerBuildList extends StatefulWidget {
  @override
  const MenuEndDrawerBuildList({
    Key? key,
  }) : super(key: key);

  _MenuEndDrawerBuildList createState() => _MenuEndDrawerBuildList();
}

class _MenuEndDrawerBuildList extends State<MenuEndDrawerBuildList> {
  @override
  void initState() {
    getContactData();
  }

  Future getContactData() async {
    //var url = 'https://www.100language.com/sql_crud_functions.php';
    //print(Uri.parse(url));
    /*var url = Uri.http('www.google.com', '/', {'q': '{http}'});
  
    print(await http
        .get(url, headers: {"charset": "utf-8", "Accept-Charset": "utf-8"}));*/
    //var response = await AppUrl().responseGet("basicVocabolaryList.json");
    /* http.Response response = await http.get(Uri.parse(url));
    dishesfromJson(response.body).forEach((element) {
      print(element.name);
      print(element.special);
    });*/
    List<Dishes> listDishes = await SqlApiService.GetAllDishes();
    listDishes.forEach((element) {
      print(element.name);
    });
    print(DishedToJson(listDishes));

    var resonse = await SqlApiService.addOrder();

    print("hello" + resonse);
    //print(dishesfromJson(response.body));
    // print('Status code: ${response.statusCode}');
    // print('Headers: ${response.headers}');
    // print('Body: ${response.body}');
/*
    print(Uri.https('www.100language.com', '/connection.php/'));
    var uri = Uri.https('www.100language.com');
    print(uri);
    final response = await http.get(
      uri,
      headers: {
        "content-type": "application/json" // This preventes empty response body
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print("Ciao2");
    } else {
      print("Ciao3");
    }
    print("Ciao1");
    print(response);
    final body = json.decode(response.body);
    print(body);
*/
/*
    var url = Uri.https(
        'www.100language.com', '/sql_crud_functions.php', {'q': '{https}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      print('Number of books about http: $jsonResponse.');
    }

    print(response);*/
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: SqlApiService.GetAllDishes(),
        builder: ((context, snapshot) {
          //if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Dishes dish = snapshot.data![index];
                    return ListTile(
                      leading: Icon(Icons.add),
                      title: Text(dish.name + " x " + dish.quantity.toString()),
                      trailing: Icon(Icons.remove),
                    );

                    //   List list = snapshot.data;
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
        /*ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.list),
            title: Text("GFG item $index"),
            trailing: Icon(Icons.done),
          );
        },
      ),*/
      ),
    );
  }
}
