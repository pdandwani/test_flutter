import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class GetRecipe extends StatefulWidget {
  @override
  _GetRecipeState createState() => _GetRecipeState();
}

class _GetRecipeState extends State<GetRecipe> {
  String fact = "Welcome to the World of Facts !";

  Future<void> getRecipe() async {
    Response response =
        await get('https://uselessfacts.jsph.pl/random.json?language=en');
    Map data = jsonDecode(response.body);
    setState(() {
      fact = (data['text']);
    });
    print(fact);
    return fact;
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Facts',
          style: TextStyle(
            color: Colors.red,
            fontSize: 35.0,
          ),
        ),
        centerTitle: true,
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     FlatButton(
      //         child: Text('Press Me'),
      //         onPressed: () {
      //           getRecipe();
      //           //setState(() => fact = getRecipe() as String);
      //         }),
      //     Text(fact),
      //   ],
      // ),
      body: Container(
        color: Colors.grey[400],
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              child: Text(
                'Press Me',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.red,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red),
              ),
              //color: Colors.red,
              onPressed: () {
                getRecipe();
                //setState(() => fact = getRecipe() as String);
              },
            ),
            Container(
              height: 150.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fact,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
