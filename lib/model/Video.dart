import 'dart:core';
import 'package:firebase_database/firebase_database.dart';

class Video {
   String? id;
   String? userId;
   String? name;
   String? url;
   String? description;


   Video ({ this.id, required this.name, required this.userId , required this.url ,  required this.description});

   Map< String, dynamic > toJson ( ) {
     return {
       'name': name!,
       'userId': userId!,
       'description': description == null ? '' : description!,
       'url': url!,
     };
   }

   factory Video.fromDataSnapshot(DataSnapshot dataSnapshot) {
     Map<String, dynamic> data = Map<String, dynamic>.from(dataSnapshot.value as Map<dynamic, dynamic>);
     return Video(
         id: dataSnapshot.key,
         userId: data['userId'],
         name: data["name"],
         url: data["url"],
         description: data["description"]
     );
   }

 }
