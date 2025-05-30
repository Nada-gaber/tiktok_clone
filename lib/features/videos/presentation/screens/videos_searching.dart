import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/search_video_state.dart';
import '../../logic/video_searching_cubit.dart';
import '../widgets/category_filter_list.dart';
import '../widgets/search_bar_textfiled.dart';
import '../widgets/video_grid.dart';
import '../widgets/video_type_tab_bar.dart';

class SearchVideoScreen extends StatefulWidget {
  const SearchVideoScreen({super.key});

  @override
  State<SearchVideoScreen> createState() => _SearchVideoScreenState();
}

class _SearchVideoScreenState extends State<SearchVideoScreen> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedCategory;
  String? _selectedVideoType;
  final List<String> categories = [
    'all',
    'nature',
    'technology',
    'people',
    'animals',
    'business',
    'food',
    'sports',
    'education',
  ];
  final List<String> videoTypes = ['all', 'film', 'animation'];
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _triggerSearch(context);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _triggerSearch(BuildContext context) {
    context.read<SearchVideoCubit>().searchVideos(
          query: _searchController.text,
          category: _selectedCategory,
          videoType: _selectedVideoType,
        );
  }

  void _showCategoryFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Select Category'),
          content: SizedBox(
            width: double.maxFinite,
            child: CategoryFilterList(
                categories: categories,
                onCategorySelected: (category) {
                  setState(() {
                    _selectedCategory = category == 'all' ? null : category;
                  });
                  _triggerSearch(context);
                  Navigator.pop(dialogContext);
                }),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBarWidget(
              controller: _searchController,
              selectedCategory: _selectedCategory,
              onChanged: (query) => _triggerSearch(context),
              onFilterPressed: () => _showCategoryFilterDialog(context),
            ),
            VideoTypeTabBar(
              videoTypes: videoTypes,
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                  _selectedVideoType =
                      videoTypes[index] == 'all' ? null : videoTypes[index];
                });
                _triggerSearch(context);
              },
            ),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<SearchVideoCubit, SearchVideoState>(
                builder: (blocContext, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: Text('Search for videos')),
                    loading: () => _buildShimmerLoading(),
                    loaded: (videos) => VideoGrid(videos: videos),
                    error: (message) => Center(child: Text(message)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      },
    );
  }
}
