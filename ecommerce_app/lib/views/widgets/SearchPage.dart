import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductItemModel> _searchResults = [];
  List<ProductItemModel> _recentSearches = []; // List to hold recent searches

  void _updateSearchResults(String query) {
    setState(() {
      _searchResults = dummyProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _addToRecentSearches(ProductItemModel product) {
    setState(() {
      // Add product to recent searches list
      _recentSearches.insert(0, product);

      // Limit the list to 5 items
      if (_recentSearches.length > 5) {
        _recentSearches.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _updateSearchResults,
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent Searches
          if (_recentSearches.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Searches',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _recentSearches
                          .map((product) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: _buildRecentSearchChip(product),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          // Search Results
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index].name),
                  onTap: () {
                    _addToRecentSearches(_searchResults[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearchChip(ProductItemModel product) {
    return GestureDetector(
      onTap: () {
        // Handle tap on recent search
      },
      child: Chip(
        label: Text(product.name),
        avatar: CircleAvatar(
          backgroundImage: NetworkImage(product.imgUrl),
        ),
      ),
    );
  }
}

