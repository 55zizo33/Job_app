import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/home_screen/search3.dart';

class Search2View extends StatefulWidget {
  @override
  _Search2ViewState createState() => _Search2ViewState();
}

class _Search2ViewState extends State<Search2View> {
  final List<String> recentSearches = [
    'Junior UI Designer',
    'Junior UX Designer',
    'Product Designer',
    'Project Manager',
    'UI/UX Designer',
    'Front-End Developer',
  ];

  final List<String> popularSearches = [
    'UI/UX Designer',
    'Project Manager',
    'Product Designer',
    'UX Designer',
    'Front-End Developer',
  ];

  late List<String> filteredRecentSearches;
  late List<String> filteredPopularSearches;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRecentSearches = recentSearches;
    filteredPopularSearches = popularSearches;
    searchController.addListener(_filterSearchResults);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterSearchResults() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredRecentSearches = recentSearches
          .where((search) => search.toLowerCase().contains(query))
          .toList();
      filteredPopularSearches = popularSearches
          .where((search) => search.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: 'Type something...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFE5E7EB),
                  height: 36,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Recent searches', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                _buildSearchList(filteredRecentSearches, 'assets/svg/clock.svg', 'assets/svg/close-circle.svg', Colors.red),
                SizedBox(height: 5),
                Container(
                  color: Color(0xFFE5E7EB),
                  height: 36,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Popular searches', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                _buildSearchList(filteredPopularSearches, 'assets/svg/search-status.svg', 'assets/images/arrow-right.png', Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchList(List<String> searches, String leadingIconPath, String trailingIconPath, Color trailingIconColor) {
    return Column(
      children: searches.map((search) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Search3View()),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 1.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(leadingIconPath, width: 22, height: 22),
                    SizedBox(width: 10),
                    Text(search),
                  ],
                ),
                IconButton(
                  icon: trailingIconPath.endsWith('.svg')
                      ? SvgPicture.asset(trailingIconPath, width: 22, height: 22, color: trailingIconColor)
                      : Image.asset(trailingIconPath, width: 22, height: 22, color: trailingIconColor),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Button pressed for $search')),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
