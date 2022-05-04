import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _builCustomItem(String title, IconData iconData) {
      return Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_outline_sharp,
              size: 40,
            ),
          ),
          Column(
            children: [
              _builCustomItem('Sophie', Icons.person),
              _builCustomItem('+255754 542 862', Icons.phone),
              _builCustomItem('sophie@gmail.com', Icons.email),
            ],
          ),
          _builCustomItem('Logout', Icons.exit_to_app),
        ],
      ),
    );
  }
}
