import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/data/models/video_model.dart';
import '../../home/data/repo/video_repo.dart';
import 'search_video_state.dart';

class SearchVideoCubit extends Cubit<SearchVideoState> {
  final VideoRepository repository;
  List<Hit> _cachedVideos = [];

  SearchVideoCubit(this.repository) : super(const SearchVideoState.initial());

  Future<void> searchVideos({
    String query = '',
    String? category,
    String? videoType,
  }) async {
    emit(const SearchVideoState.loading());
    try {
      // Fetch videos only if cache is empty or filters require new data
      if (_cachedVideos.isEmpty || category != null || videoType != null) {
        final response = await repository.getVideos(
          query: query.isNotEmpty ? query : null,
          category: category,
          videoType: videoType,
        );
        _cachedVideos = response.hits ?? [];
      }

      // Local filtering for search query if no new API call is needed
      final filteredVideos = query.isEmpty
          ? _cachedVideos
          : _cachedVideos
              .where((video) => video.tags
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
                  false)
              .toList();
      if (isClosed) return; 
      emit(SearchVideoState.loaded(filteredVideos));
    } catch (e) {
      
      if (isClosed) return; 
      emit(SearchVideoState.error(e.toString()));
    }
  }
}