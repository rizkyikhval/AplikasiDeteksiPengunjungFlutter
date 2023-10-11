import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cms/splashscreen/splash.dart';
import 'package:cms/drawer/Profil.dart';
import 'package:cms/drawer/ubahpassword.dart';

class ubahpassword extends StatefulWidget {
  const ubahpassword({super.key});

  @override
  State<ubahpassword> createState() => _ubahpasswordState();
}

class _ubahpasswordState extends State<ubahpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Edit Password"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.grey,
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                  leading: Icon(Icons.person),
                  title: new Text("Profil"),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profil()))),
              new ListTile(
                  leading: Icon(Icons.vpn_key),
                  title: new Text("Edit Password"),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ubahpassword()))),
              new Divider(),
              new ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: new Text("Keluar"),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashPage())))
            ],
          ),
        ),
        body: Container());
  }
}
