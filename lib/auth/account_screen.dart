import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tfos/auth/auths.dart';

class AccountScreenn extends StatelessWidget {
  const AccountScreenn({Key? key}) : super(key: key);
  static const routeName = '/accountt-screen';

  void _logout(BuildContext context) {
    Provider.of<Auth>(context, listen: false).logout();
    //  Navigator.pushReplacementNamed(context, BottomNavigationScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                ),
                Positioned(
                  bottom: -80,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Card(
                        child: Column(
                      children: [
                        Container(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${user?.name}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                '${user?.email}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.help),
                        title: const Text(
                          'Helps',
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: const Text('call +255747343174'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                      const ListTile(
                        leading: Icon(Icons.verified_outlined),
                        title: Text(
                          'About App',
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text('@VaccineMS V1.0.0'),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text(
                          'Log Out',
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: const Text('Exit app'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          _logout(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Text(
                  //   'Tellwap Inc',
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
