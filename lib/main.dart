import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:wanandroid/pages/main_left_page.dart';
import 'package:wanandroid/pages/home_page.dart';
import 'package:wanandroid/pages/system_page.dart';
import 'package:wanandroid/pages/nav_page.dart';
import 'package:wanandroid/pages/wechat_page.dart';
import 'package:wanandroid/pages/project_page.dart';
import 'package:wanandroid/pages/search_page.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '玩Android',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  List bottomNavTxts = ['首页', '体系', '公众号', '导航', '项目'];
  var title = "玩Android";
  List<BottomNavigationBarItem> bottomNavViews;

  var _body;

  initData() {
    _body = IndexedStack(
      children: <Widget>[HomePage(), SystemPage(), WechatPage(), NavPage(), ProjectPage()],
      index: _selectedIndex,
    );

  }


  @override
  void initState() {
    super.initState();
    bottomNavViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: Text(bottomNavTxts[0]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.widgets),
        title: Text(bottomNavTxts[1]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: Text(bottomNavTxts[2]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.widgets),
        title: Text(bottomNavTxts[3]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: Text(bottomNavTxts[4]),
        backgroundColor: Colors.blue,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text(title),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.search), onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context){
              return new Search();
            }));
          }),
        ],
      ),
      body: _body,
      drawer: new MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: bottomNavViews.map((BottomNavigationBarItem navigationView) => navigationView).toList(),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index == 0){
        title = "玩Android";
      }else{
        title = bottomNavTxts[index];
      }
    });
  }

  void _onAdd() {}
}
