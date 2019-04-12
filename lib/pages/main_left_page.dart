import 'package:flutter/material.dart';
import 'package:wanandroid/pages/setting_page.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.only(
                    top: 38.0,bottom: 16),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  ClipOval(
                    child: Image.asset("assets/avatar.jpg",width: 80,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "jianmenguan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                  
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 20.0),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context){
                        return new Setting();
                      }));
                    }
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                    onTap:(){
                      Navigator.push(context, new MaterialPageRoute(builder: (context){
                        return new Setting();
                      }));
                    } ,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}