https://docs.flutter.dev/cookbook/networking/fetch-data
1) run terminal: flutter pub add http or http: any or #  http: ^1.6.0 in yaml file 

2) Import import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


snapshot: one chunck of data when we tried to fetch it 
  
** in exam -> we will use photos where we will use listview and images 
https://jsonplaceholder.typicode.com/photos
Fake Json 
https://jsonplaceholder.typicode.com/users
[ // where this is represented array 
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },...]
https://jsonplaceholder.typicode.com/user
