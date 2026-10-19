import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Album.dart';

Future<List<Album>> fetchAlbums() async {
 final response = await http.get(
 Uri.parse('https://jsonplaceholder.typicode.com/albums'),
 );
 if (response.statusCode == 200) {
 // create a list of objects

 List<dynamic> jsonlist = jsonDecode(response.body);
 return jsonlist.map((json) => Album.fromJson(json)).toList();

 //return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
 } else {
 throw Exception('Failed to load');
 }
}

void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
 return MaterialApp(home: MyInternetData());
 }
}

class MyInternetData extends StatefulWidget {
 const MyInternetData({super.key});

 @override
 State<MyInternetData> createState() => _MyInternetDataState();
}

class _MyInternetDataState extends State<MyInternetData> {
 late Future<List<Album>> futureAlbums;

 @override
 void initState() {
 // TODO: implement initState
 super.initState();
 futureAlbums = fetchAlbums();
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: Text('Fetch Data from Net'),
 backgroundColor: Colors.green,
 centerTitle: true,
 ),
 backgroundColor: Colors.lightBlue,
 body: FutureBuilder<List<Album>>(
 future: futureAlbums,
 builder: (context, snapshot) {
 if (snapshot.hasData) {
 final albums = snapshot.data!;
 return ListView.builder(
 itemCount: albums.length,
 itemBuilder: (context, index) {
 final album = albums[index];
 return ListTile(
 trailing: CircleAvatar(child: Text('${album.id}')),
 title: Text(album.title),
 subtitle: Text('user id : ${album.userId}'),
 );
 },
 );
 } else if (snapshot.hasError) {
 return Center(child: Text('Error : ${snapshot.error}'));
 }
 return Center(child: CircularProgressIndicator());
 },
 ),
 );
 }
}
