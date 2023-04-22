import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/core/widgets/movie_list_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "searchPage",
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0.w),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  hintText: 'Find a movie that interests you',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            Expanded(
              child: _searchQuery.isEmpty
                  ? const Center(
                      child: Text(
                        "Enter a search query",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    )
                  : ListView.builder(
                      itemCount: 10, // Replace with actual search results
                      itemBuilder: (BuildContext context, int index) {
                        return MovieListCard();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
