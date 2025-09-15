import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minecraft_manager/providers/item_provider.dart';
import 'package:minecraft_manager/image_proxy.dart';
import 'package:minecraft_manager/widgets/animated_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ItemProvider>(context, listen: false).fetchItems();
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
      appBar: AppBar(
        title: const Text('Minecraft Items'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                Provider.of<ItemProvider>(context, listen: false).searchItems(query);
              },
              decoration: InputDecoration(
                hintText: 'Search items...', 
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0), // Mais quadriculado
                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  borderSide: BorderSide(color: Theme.of(context).hintColor, width: 2),
                ),
              ),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: Consumer<ItemProvider>(
              builder: (context, itemProvider, child) {
                if (itemProvider.status == ItemLoadingStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (itemProvider.status == ItemLoadingStatus.error) {
                  return Center(child: Text('Error: ${itemProvider.errorMessage}'));
                } else if (itemProvider.items.isEmpty) {
                  return const Center(child: Text('No items found.'));
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10, // Number of columns in the grid
                      crossAxisSpacing: 1.0, // Horizontal space between grid items
                      mainAxisSpacing: 1.0, // Vertical space between grid items
                      childAspectRatio: 0.7, // Width/height ratio of each grid item
                    ),
                    itemCount: itemProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = itemProvider.items[index];
                      return AnimatedItemCard(item: item);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

