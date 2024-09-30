
import 'dart:convert';


class Post {
  List<Post>? movies;
  int? id;
  String? tittle;
  int? categoryId;
  dynamic photo;
  String? author;
  String? desc;
  DateTime? createdAt;
  DateTime? updatedAt;

  Post({
    this.id,
    this.tittle,
    this.categoryId,
    this.photo,
    this.author,
    this.desc,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"]??0,
        tittle: json["tittle"]??"",
        categoryId: json["category_id"]??0,
        photo: json["photo"]==null ? null :json["photo"],
        author: json["author"]??"",
        desc: json["desc"]??"",
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tittle": tittle,
        "category_id": categoryId,
        "photo": photo,
        "author": author,
        "desc": desc,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}





























// class MovieListModel{
//   List<Movies>? movies;

//   MoviesListModel({this.movies});

//   MoviesListModel.fromJson(Map<String, dynamic> Json){
//     if(Json['movies'] != null){
//       movies=<Movies>[];
//       Json['movies'].forEach((v){
//         movies!.add(new Movies.fromJson(v));
//       });
//     }
//   }
//   Map<String, dynamic> toJson(){
//     final Map<String, dynamic> data =new Map<String ,dynamic>();
//     if(this.movies != null){
//       data['movies']= this.movies!.map((v) => v.toJson()).toList();
//     } 
//     return data;
//   }
// }
// class Movies{
//   String? id;
//   String? title;
//   String? year;
//   List <String>? genres;
//   List <int>? rating;
//   String? poster;
//   dynamic contentRating;

//   Movies(
//     {
//       this.id,
//       this.title,
//       this.year,
//       this.genres,
//       this.rating,
//       this.poster,
//       this.contentRating

//   })

// }