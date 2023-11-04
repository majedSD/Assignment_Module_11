import 'dart:convert';
import 'package:assignmentmodule11/product_details.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    final Response response = await get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      final List<dynamic> productJson = jsonDecode(response.body);
      setState(() {
        productList = productJson.map((data) => Product(
          data['albumId'].toString(),
          data['id'].toString(),
          data['title'].toString(),
          data['url'].toString(),
          data['thumbnailUrl'].toString(),
        )).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery App'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        prototypeItem: Divider(height: 70,),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
              productList[index].ThumbnailUrl,
            ),
            title: Text(productList[index].Title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ProductDetails(product: productList[index]);
                }),
              );
            },
          );
        },
      ),
    );
  }
}

class Product {
  final String AlbumId;
  final String Id;
  final String Title;
  final String Url;
  final String ThumbnailUrl;

  Product(this.AlbumId, this.Id, this.Title, this.Url, this.ThumbnailUrl);
}
