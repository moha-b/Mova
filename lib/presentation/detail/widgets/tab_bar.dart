import 'package:flutter/material.dart';

class TabBarSection extends StatefulWidget {
  const TabBarSection({super.key});

  @override
  _TabBarSectionState createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'Tab 1',
                ),
                Tab(
                  text: 'Tab 2',
                ),
                Tab(
                  text: 'Tab 3',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Text('Tab 1 Content'),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: Center(
                      child: Text('Tab 2 Content'),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Tab 3 Content'),
                    ),
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
