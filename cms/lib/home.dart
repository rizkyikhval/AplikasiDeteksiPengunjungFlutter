import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cms/splashscreen/splash.dart';
import 'package:cms/drawer/Profil.dart';

import 'drawer/ubahpassword.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("MENU UTAMA"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
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
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        size: 80.0,
                      ),
                      Text("Detection", style: new TextStyle(fontSize: 18.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        size: 90.0,
                      ),
                      Text("History", style: new TextStyle(fontSize: 18.0))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
