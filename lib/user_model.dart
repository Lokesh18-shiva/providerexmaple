class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  UserModel(
      {required this.id,
        required this.email,
        required this.firstname,
        required this.lastname,
        required this.avatar});//defult named parmeterized constuctor

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstname: json['first_name'] ?? 'First Name',
        lastname: json['last_name'] ?? 'Last Name',
        avatar: json['avatar'] ??
            'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740');
  }
}
// class Application {
//   int? count;
//   List<Entries>? entries;

//   Application({this.count, this.entries});

//   Application.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     if (json['entries'] != null) {
//       entries = <Entries>[];
//       json['entries'].forEach((v) {
//         entries!.add(new Entries.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     if (this.entries != null) {
//       data['entries'] = this.entries!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Entries {
//   String? aPI;
//   String? description;
//   String? auth;
//   bool? hTTPS;
//   String? cors;
//   String? link;
//   String? category;

//   Entries(
//       {this.aPI,
//       this.description,
//       this.auth,
//       this.hTTPS,
//       this.cors,
//       this.link,
//       this.category});

//   Entries.fromJson(Map<String, dynamic> json) {
//     aPI = json['API'];
//     description = json['Description'];
//     auth = json['Auth'];
//     hTTPS = json['HTTPS'];
//     cors = json['Cors'];
//     link = json['Link'];
//     category = json['Category'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['API'] = this.aPI;
//     data['Description'] = this.description;
//     data['Auth'] = this.auth;
//     data['HTTPS'] = this.hTTPS;
//     data['Cors'] = this.cors;
//     data['Link'] = this.link;
//     data['Category'] = this.category;
//     return data;
//   }
// }
