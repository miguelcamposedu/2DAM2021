import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs in Flutter'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Text('Texto de ejemplo'),
              SizedBox(
                height: 70,
                child: TabBar(
                  indicatorColor: Colors.red,
                  controller: tabController,
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car, color: Colors.grey,)),
                    Tab(icon: Icon(Icons.directions_transit, color: Colors.grey,)),
                    Tab(icon: Icon(Icons.directions_bike, color: Colors.grey,)),
                  ],
                ),
              ),
              Container(
                height: 400,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Text('Tab 1'),
                    Text('Tab 2'),
                    Text('Tab 3'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
