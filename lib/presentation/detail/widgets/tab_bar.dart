import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/widgets/movie_list.dart';
import 'package:mova/presentation/detail/bloc/detail_bloc.dart';

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
              unselectedLabelColor: Colors.grey,
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(
                  text: 'Trailers',
                ),
                Tab(
                  text: 'More Like This',
                ),
                Tab(
                  text: 'Comments',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: Center(
                      child: Text('Api Don\'t Provide This Feature'),
                    ),
                  ),
                  BlocBuilder<DetailBloc, DetailState>(
                    builder: (context, state) {
                      if (state is LoadedState) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => MovieList(
                              list: state.detailEntity.recommendation),
                        );
                      } else {
                        return Container(
                          child: Center(
                            child: Text('Something wont wrong'),
                          ),
                        );
                      }
                    },
                  ),
                  Container(
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
