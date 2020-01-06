import 'package:flutter/material.dart';

class DrawerDome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "赵杰",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            accountEmail: Text("zheyuZj@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/aa06249e08f34ebb84c81b0669f75f9c.jpg"),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              image: DecorationImage(
                image: NetworkImage(
                    "https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/aa06249e08f34ebb84c81b0669f75f9c.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.blue[400].withOpacity(.6),
                  BlendMode.hardLight,
                ),
              ),
            ),
          ),
          ListTile(
              title: Text(
                "Message".toUpperCase(),
                textAlign: TextAlign.right,
              ),
              trailing: Icon(Icons.message, color: Colors.black12, size: 22)),
          ListTile(
              title: Text(
                "Message".toUpperCase(),
                textAlign: TextAlign.right,
              ),
              trailing: Icon(Icons.message, color: Colors.black12, size: 22)),
          ListTile(
            title: Text(
              "Message".toUpperCase(),
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
