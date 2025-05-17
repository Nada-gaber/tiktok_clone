import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';

class PostCubit extends Cubit<List<Post>> {
  PostCubit() : super([]);

  void addPost(Post post) {
    final updatedPosts = List<Post>.from(state)..insert(0, post); // newest first
    emit(updatedPosts);
  }
}
