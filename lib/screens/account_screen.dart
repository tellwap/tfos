import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/auth/auths.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const routeName = '/account-screen';

  void _logout(BuildContext context) {
    Provider.of<Auth>(context, listen: false).logout();
    Navigator.pop(context);
    //  Navigator.pushReplacementNamed(context, BottomNavigationScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;

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
              _builCustomItem('${user?.name}', Icons.person),
              _builCustomItem('${user?.phoneNumber}', Icons.phone),
              _builCustomItem('${user?.email}', Icons.email),
            ],
          ),
          // _builCustomItem('Logout', Icons.exit_to_app),
          InkWell(
            onTap: () {
              _logout(context);
            },
            child: Container(
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
                    child: Icon(Icons.exit_to_app),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Logout',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
