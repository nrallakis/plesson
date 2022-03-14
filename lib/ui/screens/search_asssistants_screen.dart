import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/assistant_card.dart';
import '../../viewmodels/search_assistants_viewmodel.dart';

import '../../routes.dart' as routes;
import '../components/nav_bar.dart';


class SearchAssistantsScreen extends StatelessWidget {
  const SearchAssistantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchAssistantsViewModel viewModel = context.watch<SearchAssistantsViewModel>();

    int itemCount = viewModel.filteredAssistants.length;

    return Scaffold(
      appBar: const NavBar(pageName: 'Search'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                return viewModel.suggestions.where((String option) {
                  return option.toLowerCase().startsWith(textEditingValue.text.toLowerCase());
                });
              },

              onSelected: (String selection) {
                viewModel.onSearchChanged(selection);
              },
            ),
          ),
          const CategoriesGrid(),
          if (itemCount > 0) _buildList(viewModel)
          else const Center(child: Text("No assistants found"))
        ],
      ),
    );
  }

  Widget _buildList(SearchAssistantsViewModel viewModel) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: viewModel.filteredAssistants.length,
        itemBuilder: (BuildContext context, int index) {
          return AssistantCard(
            assistant: viewModel.filteredAssistants[index],
            isBookmarked: viewModel.userHasBookmarked(viewModel.filteredAssistants[index]),
            onMessageTapped: () {
              // Open message page with assistant
              Navigator.pushNamed(context, routes.chat, arguments: viewModel.filteredAssistants[index]);
            },
            onMoreInfoTapped: () {
              // Open assistant details page
              Navigator.pushNamed(context, routes.assistant,
                  arguments: viewModel.filteredAssistants[index]);
            },
            onBookmarkTapped: () {
              viewModel.onBookmarkTapped(viewModel.filteredAssistants[index]);
            },
          );
        },
      ),
    );
  }

}

final categories = [
  Category(name: 'Maths'),
  Category(name: 'Physics'),
  Category(name: 'UI/UX'),
  Category(name: 'Flutter'),
  Category(name: 'Operating Systems'),
  Category(name: 'Algorithms'),
];

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchAssistantsViewModel>();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(28, 22, 28, 42),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 4.6,
        mainAxisSpacing: 15,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          category: categories[index],
          onPress: () => viewModel.onSearchChanged(categories[index].name),
        );
      },
    );
  }
}


class Category {
  final String name;
  final Color color;

  Category({required this.name, this.color = Colors.teal});
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final void Function()? onPress;

  const CategoryCard({
    Key? key,
    required this.category,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Material(
          color: category.color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            splashColor: Colors.white10,
            highlightColor: Colors.white10,
            onTap: onPress,
            child: _CardContent(category.name),
          ),
        );
      },
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
