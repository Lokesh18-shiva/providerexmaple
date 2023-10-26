// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './user_model.dart';
part 'service.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  ObservableList<UserModel> users = ObservableList<UserModel>();
  @observable
  bool isloading = false;

  @action
  Future<void> fetchUsers() async {
    try {
      isloading = true;
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> userList = data['data'];
        final List<UserModel> newusers =
            userList.map((e) => UserModel.fromJson(e)).toList();
        users.clear();
        users.addAll(newusers);
      }
    } catch (e) {
      // print('Error fetching users: $e');
    } finally {
      isloading = false;
    }
  }
}
