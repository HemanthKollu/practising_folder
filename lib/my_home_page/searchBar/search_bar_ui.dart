import 'package:flutter/material.dart';
import 'package:practising_folder/my_home_page/searchBar/search_bar_model.dart';
import 'package:practising_folder/my_home_page/searchBar/search_bar_service.dart';

class SearchBarUi extends StatefulWidget {
  const SearchBarUi({super.key});

  @override
  State<SearchBarUi> createState() => _SearchBarUiState();
}

class _SearchBarUiState extends State<SearchBarUi> {
  SearchBarService service = SearchBarService();
  final TextEditingController _searchController = TextEditingController();

  List<SearchBarModel> searchItems = [];
  List<SearchBarModel> allItems = [];

  @override
  void initState() {
    super.initState();
    allItems = service.getSearchItems();
    searchItems = [];
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      searchItems = allItems.where((item) => item.name.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  // labelText: 'Search',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...',
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child:
                    allItems.isEmpty
                        ? Container()
                        : ListView.builder(
                          itemCount: searchItems.length,
                          itemBuilder: (context, index) {
                            return ListTile(title: Text(searchItems[index].name));
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
