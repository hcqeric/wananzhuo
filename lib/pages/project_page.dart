import 'package:flutter/material.dart';
import 'package:wanandroid/pages/search_page.dart';

class ProjectPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new ProjectState();
  }
}

class ProjectState extends State<ProjectPage> with SingleTickerProviderStateMixin {

  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
          TabBar( //生成Tab菜单
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList()
          ),
      body: TabBarView(
                    controller: _tabController,
                    children: tabs.map((e) { //创建3个Tab页
                      return Container(
                        alignment: Alignment.center,
                        child: Text(e, textScaleFactor: 5),
                      );
                    }).toList(),
                  ) ,
    );
  }

}