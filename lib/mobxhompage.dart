import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userStore = UserStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await userStore.fetchUsers();
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) {
                if (userStore.isloading) {
                  return const Center(
                      child: CircularProgressIndicator());
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: userStore.users.length,
                      itemBuilder: (context, index) {
                        print(userStore.users.toString());
                        final user = userStore.users[index];
                         return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          title: Text('${user.firstname} ${user.lastname}'),
                          subtitle: Text(user.email),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
